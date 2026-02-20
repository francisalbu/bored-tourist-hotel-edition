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
            className={`flex items-center gap-2.5 px-6 py-2.5 rounded-full whitespace-nowrap text-[13px] font-medium tracking-wide transition-all duration-200 border ${
              isSelected
                ? 'shadow-sm border-transparent'
                : 'bg-white text-slate-600 border-slate-200/60 hover:bg-slate-50'
            }`}
            style={isSelected ? { backgroundColor: 'var(--hotel-primary)', color: 'var(--hotel-primary-text)' } : {}}
          >
            <span className="text-base">{cat.icon}</span>
            <span>{cat.label}</span>
          </button>
        );
      })}
    </div>
  );
};
