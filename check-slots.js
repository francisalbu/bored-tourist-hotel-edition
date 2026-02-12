import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  'https://hnivuisqktlrusyqywaz.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhuaXZ1aXNxa3RscnVzeXF5d2F6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MzE3MTY3OCwiZXhwIjoyMDc4NzQ3Njc4fQ.gGLIYOJgNvm_LnsOm87LMCMAd0qgoJt1owpDY-DrjNw'
);

// Query availability slots structure
async function checkAvailabilitySlots() {
  console.log('Checking availability_slots table...\n');
  
  const { data, error } = await supabase
    .from('availability_slots')
    .select('*')
    .limit(2);
  
  if (error) {
    console.error('Error:', error);
  } else {
    console.log('Sample data from availability_slots:');
    console.log(JSON.stringify(data, null, 2));
  }
}

checkAvailabilitySlots();
