import React from 'react';
import ReactDOM from 'react-dom/client';
import { Analytics } from '@vercel/analytics/react';
import { WidgetBookingApp } from './components/WidgetBookingApp';

const root = ReactDOM.createRoot(document.getElementById('root')!);
root.render(
  <React.StrictMode>
    <WidgetBookingApp />
    <Analytics />
  </React.StrictMode>
);
