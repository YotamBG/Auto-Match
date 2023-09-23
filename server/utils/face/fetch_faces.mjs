import fetch from 'node-fetch';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url'; // Import the 'url' module

// Get the directory name using the import.meta.url property
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}

async function fetchImages(page) {
    // await sleep(getRandomInt(10000));

    const link = `https://api.generated.photos/api/frontend/v1/images?page=${page}&per_page=100&age=young-adult&gender=male`;
    console.log(link);
    try {
        const response = await fetch(link, {
            "headers": {
                "accept": "application/json, text/plain, */*",
                "authorization": "API-Key Cph30qkLrdJDkjW-THCeyA",
                "sec-ch-ua": "\"Not/A)Brand\";v=\"99\", \"Google Chrome\";v=\"115\", \"Chromium\";v=\"115\"",
                "sec-ch-ua-mobile": "?0",
                "sec-ch-ua-platform": "\"Windows\"",
                "connection": "keep-alive",
                "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36"
            },
            "referrer": "https://generated.photos/",
            // "referrerPolicy": "strict-origin-when-cross-origin",
            "body": null,
            "method": "GET",
            "mode": "cors",
            "credentials": "include"
        });

        if (response.ok) {
            const responseData = await response.json();
            return responseData.images.map(image => image.thumb_url);
        } else {
            console.error(`Error fetching images from page ${page}: ${response.statusText}`);
            return [];
        }
    } catch (error) {
        console.error(`Error fetching images from page ${page}: ${error.message}`);
        return [];
    }
}

async function fetchAllImages() {
    const totalPages = 10;
    let allImageUrls = [];

    for (let page = 1; page <= totalPages; page++) {
        const pageImageUrls = await fetchImages(page);
        // Filter out duplicates before concatenating
        allImageUrls = allImageUrls.concat(pageImageUrls.filter(url => !allImageUrls.includes(url)));
    }

    return allImageUrls;
}

async function fetchAndSaveImages() {
    const imageUrls = await fetchAllImages();
    const savePath = path.join(__dirname, 'new-faces');

    if (!fs.existsSync(savePath)) {
        fs.mkdirSync(savePath);
    }

    const fetchPromises = imageUrls.map(async (imageUrl, index) => {
        try {
            const response = await fetch(imageUrl);
            if (response.ok) {
                const imageBuffer = await response.buffer();
                const imageFilename = `face${index + 1}.jpg`;
                const imagePath = path.join(savePath, imageFilename);

                fs.writeFileSync(imagePath, imageBuffer);
                console.log(`Saved image: ${imageFilename}`);
            } else {
                console.error(`Error fetching image from URL: ${imageUrl}`);
            }
        } catch (error) {
            console.error(`Error fetching image from URL: ${imageUrl} - ${error.message}`);
        }
    });

    await Promise.all(fetchPromises);
    console.log('All images saved.');
}

fetchAndSaveImages();