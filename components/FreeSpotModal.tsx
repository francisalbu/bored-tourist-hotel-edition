import { X, MapPin, Clock, Navigation, TrendingUp } from 'lucide-react';

interface FreeSpot {
  id: string;
  title: string;
  description: string;
  category: string;
  rating: number;
  imageUrl: string;
  gps?: string;
  distance?: string;
  duration?: string;
}

interface FreeSpotModalProps {
  spot: FreeSpot;
  onClose: () => void;
}

export default function FreeSpotModal({ spot, onClose }: FreeSpotModalProps) {
  const handleOpenInMaps = () => {
    if (spot.gps) {
      // Extract coordinates from GPS string (format: "38.6764° N, 9.2024° W")
      const coords = spot.gps.match(/(\d+\.\d+)/g);
      if (coords && coords.length >= 2) {
        const lat = coords[0];
        const lng = coords[1];
        const isWest = spot.gps.includes('W');
        const finalLng = isWest ? `-${lng}` : lng;
        window.open(`https://www.google.com/maps/search/?api=1&query=${lat},${finalLng}`, '_blank');
      }
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/60 backdrop-blur-sm">
      <div className="bg-white rounded-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto shadow-2xl">
        {/* Header Image */}
        <div className="relative h-64 overflow-hidden">
          <img 
            src={spot.imageUrl} 
            alt={spot.title}
            className="w-full h-full object-cover"
          />
          <button
            onClick={onClose}
            className="absolute top-4 right-4 bg-white/90 hover:bg-white p-2 rounded-full shadow-lg transition-all"
          >
            <X className="h-5 w-5 text-slate-700" />
          </button>
          <div className="absolute bottom-4 left-4">
            <span className="bg-blue-600 text-white text-xs font-bold px-3 py-1.5 rounded-full shadow-lg">
              FREE
            </span>
          </div>
        </div>

        {/* Content */}
        <div className="p-6">
          {/* Title & Rating */}
          <div className="mb-4">
            <h2 className="text-2xl font-bold text-slate-900 mb-2">{spot.title}</h2>
            <div className="flex items-center gap-3 text-sm">
              <span className="bg-slate-100 px-3 py-1 rounded-full text-slate-700 font-medium">
                {spot.category}
              </span>
              <span className="text-slate-600">⭐ {spot.rating}</span>
            </div>
          </div>

          {/* Description */}
          <div className="mb-6">
            <p className="text-slate-600 leading-relaxed">{spot.description}</p>
          </div>

          {/* Trail Info */}
          {(spot.distance || spot.duration || spot.gps) && (
            <div className="bg-slate-50 rounded-xl p-4 mb-6 space-y-3">
              {spot.distance && (
                <div className="flex items-center gap-3">
                  <div className="bg-white p-2 rounded-lg">
                    <TrendingUp className="h-5 w-5 text-blue-600" />
                  </div>
                  <div>
                    <p className="text-xs text-slate-500 font-medium">Distance</p>
                    <p className="text-sm font-semibold text-slate-900">{spot.distance}</p>
                  </div>
                </div>
              )}
              
              {spot.duration && (
                <div className="flex items-center gap-3">
                  <div className="bg-white p-2 rounded-lg">
                    <Clock className="h-5 w-5 text-blue-600" />
                  </div>
                  <div>
                    <p className="text-xs text-slate-500 font-medium">Duration</p>
                    <p className="text-sm font-semibold text-slate-900">{spot.duration}</p>
                  </div>
                </div>
              )}

              {spot.gps && (
                <div className="flex items-center gap-3">
                  <div className="bg-white p-2 rounded-lg">
                    <MapPin className="h-5 w-5 text-blue-600" />
                  </div>
                  <div>
                    <p className="text-xs text-slate-500 font-medium">Coordinates</p>
                    <p className="text-sm font-semibold text-slate-900">{spot.gps}</p>
                  </div>
                </div>
              )}
            </div>
          )}

          {/* Action Buttons */}
          <div className="flex gap-3">
            <button
              onClick={handleOpenInMaps}
              className="flex-1 bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 px-6 rounded-xl transition-colors flex items-center justify-center gap-2"
            >
              <Navigation className="h-5 w-5" />
              Open in Maps
            </button>
            <button
              onClick={onClose}
              className="px-6 py-3 border-2 border-slate-200 hover:border-slate-300 text-slate-700 font-semibold rounded-xl transition-colors"
            >
              Close
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
