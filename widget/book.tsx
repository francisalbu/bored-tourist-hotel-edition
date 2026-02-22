import React from 'react';
import ReactDOM from 'react-dom/client';
import { WidgetBookingApp } from './components/WidgetBookingApp';

const root = ReactDOM.createRoot(document.getElementById('root')!);
root.render(
  <React.StrictMode>
    <WidgetBookingApp />
  </React.StrictMode>
);
