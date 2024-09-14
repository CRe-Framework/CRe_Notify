document.addEventListener('DOMContentLoaded', (event) => {
    window.addEventListener('message', (e) => {
        if (e.data.void === 'add_notify') {
            const audio = new Audio('./sound.mp3');

            const div = document.createElement('div');
            div.className = e.data.type;

            const header = document.createElement('div');
            header.className = 'header';

            if (e.data.type !== 'party') {
                const img = document.createElement('img');
                img.src = `./img/${e.data.type}.png`;
                header.appendChild(img);
            }

            const h1 = document.createElement('h1');
            h1.id = 'title';
            h1.textContent = e.data.title;
            header.appendChild(h1);

            const span = document.createElement('span');
            span.id = 'content';
            span.textContent = e.data.span;

            div.appendChild(header);
            div.appendChild(span);

            document.querySelector('.container').appendChild(div);
            audio.play();

            setTimeout(() => {
                div.remove();
            }, e.data.time);
        }
    });
});