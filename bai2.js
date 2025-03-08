const axios = require('axios');
const API_KEY = '0d5e66763482e2509a98624a16260559';
const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
async function getWeatherData(city) {
    try {
        const response = await axios.get(BASE_URL, {
            params: {
                q: city,
                appid: API_KEY,
                units: 'metric'
            }
        });

        const { main, weather, name } = response.data;
        // console.log(response.data);

        return {
            city: name,
            temperature: main.temp,
            humidity: main.humidity,
            description: weather[0].description,
            timestamp: new Date().toISOString()
        };

    } catch (error) {
        console.error('Lỗi khi lấy dữ liệu thời tiết:', error.message);
        throw new Error('Không thể lấy dữ liệu thời tiết.');
    }
}

getWeatherData('London')
    .then(data => console.log(data))
    .catch(err => console.error(err.message));