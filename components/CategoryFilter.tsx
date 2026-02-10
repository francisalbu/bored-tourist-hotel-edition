import React from 'react';
import { Category } from '../types';

interface CategoryFilterProps {
  categories: Category[];
  selectedCategory: string;
  onSelectCategory: (id: string) => void;
}

export const CategoryFilter: React.FC<CategoryFilterProps> = ({
  categories,
  selectedCategory,
  onSelectCategory,
}) => {
  return (
    <div className="flex overflow-x-auto no-scrollbar gap-2 items-center">
      {categories.map((cat) => {
        const isSelected = selectedCategory === cat.id;
        return (
          <button
            key={cat.id}
            onClick={() => onSelectCategory(cat.id)}
            className={`
              flex items-center gap-2 px-4 py-2 rounded-full whitespace-nowrap text-[11px] font-black uppercase tracking-wider transition-all duration-200 border
              ${isSelected 
                ? 'bg-black text-white border-black shadow-md' 
                : 'bg-white text-slate-500 border-slate-200 hover:border-emerald-400 hover:text-black'}
            `}
          >
            <span className="text-sm">{cat.icon}</span>
            <span>{cat.label}</span>
          </button>
        );
      })}
    </div>
  );
};
