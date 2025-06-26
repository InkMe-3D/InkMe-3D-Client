import React from 'react';

const Custom3D = () => {
    const user = JSON.parse(localStorage.getItem('user') || '{}');
    const userId = user._id || '';

    return (
        <div style={{
            width: '95vw',
            height: '95vh',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            background: 'transparent'
        }}>
            <iframe
                src={`https://inkme-3d-page-custom-production.up.railway.app?userId=${userId}`}
                width="100%"
                height="100%"
                style={{
                    border: 'none',
                    borderRadius: '18px',
                    boxShadow: '0 8px 32px rgba(40,60,120,0.18)',
                    background: '#fff',
                    minHeight: '400px',
                    minWidth: '320px'
                }}
                title="Custom 3D Preview"
            ></iframe>
        </div>
    );
};

export default Custom3D;