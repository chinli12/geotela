// Initialize Google Maps API dynamically
// This script loads the Google Maps API without exposing the key in HTML

(function() {
  // In development, use environment variables from .env
  // In production, fetch from your backend secure endpoint
  
  function getGoogleMapsApiKey() {
    // Try to get from window object (set by Flutter)
    if (window.GOOGLE_MAPS_API_KEY) {
      return window.GOOGLE_MAPS_API_KEY;
    }
    
    // Fallback: fetch from backend (recommended for production)
    // This prevents exposing the key in client code
    return fetch('/api/config/google-maps-key')
      .then(response => response.json())
      .then(data => data.apiKey)
      .catch(() => {
        console.error('Failed to load Google Maps API key');
        return '';
      });
  }

  // Load Google Maps API when the script runs
  getGoogleMapsApiKey().then(apiKey => {
    if (!apiKey) {
      console.warn('Google Maps API key not configured');
      return;
    }
    
    const script = document.createElement('script');
    script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}`;
    script.async = true;
    script.defer = true;
    document.head.appendChild(script);
  });
})();
