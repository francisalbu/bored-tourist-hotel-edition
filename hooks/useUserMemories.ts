import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';
import { UserMemoryDisplay } from '../types';

export const useUserMemories = (userId: string) => {
  const [memory, setMemory] = useState<UserMemoryDisplay | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    fetchMemory();
  }, [userId]);

  const fetchMemory = async () => {
    try {
      setLoading(true);
      const { data, error } = await supabase
        .from('user_memories')
        .select('*')
        .eq('user_id', userId)
        .single();

      if (error && error.code !== 'PGRST116') { // PGRST116 = no rows returned
        throw error;
      }

      if (data) {
        setMemory({
          id: data.id,
          name: data.name,
          relationshipStatus: data.relationship_status,
          interests: data.interests || [],
          summary: data.summary,
          memories: data.memories || [],
          conversationCount: data.conversation_count || 0,
          lastInteraction: data.last_interaction
        });
      } else {
        // Create new memory record for new user
        const { data: newData, error: createError } = await supabase
          .from('user_memories')
          .insert([{
            user_id: userId,
            memories: [],
            conversation_count: 0
          }])
          .select()
          .single();

        if (createError) throw createError;

        setMemory({
          id: newData.id,
          memories: [],
          conversationCount: 0
        });
      }
    } catch (err: any) {
      console.error('Error fetching memory:', err);
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const updateMemory = async (updates: Partial<UserMemoryDisplay>) => {
    try {
      const dbUpdates: any = {
        updated_at: new Date().toISOString(),
        last_interaction: new Date().toISOString()
      };

      if (updates.name !== undefined) dbUpdates.name = updates.name;
      if (updates.relationshipStatus !== undefined) dbUpdates.relationship_status = updates.relationshipStatus;
      if (updates.interests !== undefined) dbUpdates.interests = updates.interests;
      if (updates.summary !== undefined) dbUpdates.summary = updates.summary;
      if (updates.memories !== undefined) dbUpdates.memories = updates.memories;
      if (updates.conversationCount !== undefined) dbUpdates.conversation_count = updates.conversationCount;

      const { data, error } = await supabase
        .from('user_memories')
        .update(dbUpdates)
        .eq('user_id', userId)
        .select()
        .single();

      if (error) throw error;

      setMemory({
        id: data.id,
        name: data.name,
        relationshipStatus: data.relationship_status,
        interests: data.interests || [],
        summary: data.summary,
        memories: data.memories || [],
        conversationCount: data.conversation_count || 0,
        lastInteraction: data.last_interaction
      });

      return data;
    } catch (err: any) {
      console.error('Error updating memory:', err);
      throw err;
    }
  };

  const addMemory = async (newMemory: string) => {
    if (!memory) return;
    
    const updatedMemories = [...memory.memories, newMemory];
    await updateMemory({ memories: updatedMemories });
  };

  const downloadMemories = () => {
    if (!memory) return;

    const data = {
      name: memory.name || 'Unknown Guest',
      relationshipStatus: memory.relationshipStatus,
      interests: memory.interests,
      summary: memory.summary,
      memories: memory.memories,
      conversationCount: memory.conversationCount,
      lastInteraction: memory.lastInteraction,
      exportedAt: new Date().toISOString()
    };

    const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `memories-${memory.name || 'guest'}-${Date.now()}.json`;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  };

  return {
    memory,
    loading,
    error,
    updateMemory,
    addMemory,
    downloadMemories,
    refreshMemory: fetchMemory
  };
};
