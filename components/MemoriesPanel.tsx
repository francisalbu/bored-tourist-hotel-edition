import React from 'react';
import { Brain, Download, Plus, User } from 'lucide-react';
import { UserMemoryDisplay } from '../types';

interface MemoriesPanelProps {
  memory: UserMemoryDisplay | null;
  loading: boolean;
  onAddMemory?: () => void;
  onDownload?: () => void;
}

export const MemoriesPanel: React.FC<MemoriesPanelProps> = ({
  memory,
  loading,
  onAddMemory,
  onDownload
}) => {
  if (loading) {
    return (
      <div className="h-full bg-slate-900 text-white flex items-center justify-center">
        <div className="animate-pulse text-center">
          <Brain className="w-12 h-12 mx-auto mb-3 text-pink-400" />
          <p className="text-sm font-medium text-slate-400">Loading memories...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="h-full bg-slate-900 text-white flex flex-col overflow-hidden">
      {/* Header */}
      <div className="px-6 py-6 border-b border-slate-800">
        <div className="flex items-center justify-between mb-6">
          <h1 className="text-2xl font-black uppercase tracking-tight">Memories</h1>
          <div className="flex items-center gap-2">
            {onAddMemory && (
              <button
                onClick={onAddMemory}
                className="px-4 py-2 bg-pink-500 hover:bg-pink-600 rounded-full text-xs font-bold uppercase tracking-wider transition-colors flex items-center gap-2"
              >
                <Plus size={14} />
                Add more
              </button>
            )}
            {onDownload && (
              <button
                onClick={onDownload}
                className="px-4 py-2 bg-slate-800 hover:bg-slate-700 rounded-full text-xs font-bold uppercase tracking-wider transition-colors flex items-center gap-2"
              >
                <Download size={14} />
                Download
              </button>
            )}
          </div>
        </div>
      </div>

      {/* Content */}
      <div className="flex-1 overflow-y-auto px-6 py-6 space-y-6">
        {/* Trust Message */}
        <div className="bg-slate-800/50 rounded-2xl p-6 border border-slate-700">
          <h2 className="text-lg font-bold mb-3">Here's what I know about you</h2>
          <p className="text-sm text-slate-400 leading-relaxed">
            I want to be fully transparent with you since your privacy and trust matter to me. 
            You can delete any memory at any time, or download your information.
          </p>
        </div>

        {/* Summary Section */}
        {memory?.summary && (
          <div>
            <div className="flex items-center gap-2 mb-3">
              <User className="w-4 h-4 text-pink-400" />
              <h3 className="text-sm font-bold uppercase tracking-wider text-slate-400">Summary</h3>
            </div>
            <div className="bg-slate-800/50 rounded-2xl p-5 border border-slate-700">
              <p className="text-sm text-slate-300 leading-relaxed">
                {memory.summary}
              </p>
            </div>
          </div>
        )}

        {/* Memories List */}
        {memory && memory.memories.length > 0 && (
          <div>
            <div className="flex items-center gap-2 mb-3">
              <Brain className="w-4 h-4 text-pink-400" />
              <h3 className="text-sm font-bold uppercase tracking-wider text-slate-400">
                Your memories ({memory.memories.length})
              </h3>
            </div>
            <div className="space-y-3">
              {memory.memories.map((mem, idx) => (
                <div 
                  key={idx}
                  className="bg-slate-800/50 rounded-xl p-4 border border-slate-700 hover:border-pink-500/30 transition-colors"
                >
                  <p className="text-sm text-slate-300">{mem}</p>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Empty State */}
        {(!memory || memory.memories.length === 0) && !memory?.summary && (
          <div className="text-center py-12">
            <Brain className="w-16 h-16 mx-auto mb-4 text-slate-700" />
            <h3 className="text-lg font-bold mb-2 text-slate-400">No memories yet</h3>
            <p className="text-sm text-slate-500 max-w-md mx-auto">
              Start chatting with the concierge and I'll build a personalized profile 
              based on your preferences and interactions.
            </p>
          </div>
        )}

        {/* Stats */}
        {memory && memory.conversationCount > 0 && (
          <div className="bg-slate-800/30 rounded-xl p-4 border border-slate-700/50">
            <div className="flex items-center justify-between text-xs text-slate-400">
              <span>Conversations</span>
              <span className="font-bold text-pink-400">{memory.conversationCount}</span>
            </div>
            {memory.lastInteraction && (
              <div className="flex items-center justify-between text-xs text-slate-400 mt-2 pt-2 border-t border-slate-700">
                <span>Last interaction</span>
                <span className="font-medium">
                  {new Date(memory.lastInteraction).toLocaleDateString('en-US', {
                    month: 'short',
                    day: 'numeric',
                    year: 'numeric'
                  })}
                </span>
              </div>
            )}
          </div>
        )}

        {/* Download All Button */}
        {memory && memory.memories.length > 0 && (
          <button
            onClick={onDownload}
            className="w-full py-4 bg-pink-500/10 hover:bg-pink-500/20 border-2 border-pink-500/30 rounded-2xl text-sm font-bold uppercase tracking-wider text-pink-400 transition-colors flex items-center justify-center gap-2"
          >
            <Download size={16} />
            Download all your memories
          </button>
        )}
      </div>
    </div>
  );
};
