function sendData(data, event) {
    fetch(`https://${GetParentResourceName()}/${event}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify(data)
    });
}

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
        } else if(e.data.void === 'add_dialog') {
            const dialogElement = document.querySelector('.dialog');
            if (dialogElement) {
                dialogElement.remove();
            }

            const div = document.createElement('div')
            div.className = 'dialog'

            const span = document.createElement('span')
            span.id = 'message'
            span.textContent = e.data.message

            const y = document.createElement('button')
            y.id = 'y'
            y.textContent = 'Y'

            const n = document.createElement('button')
            n.id = 'n'
            n.textContent = 'U'

            div.appendChild(span)
            div.appendChild(y)
            div.appendChild(n)

            document.querySelector('body').appendChild(div)

            const audio = new Audio('./sound.mp3');
            audio.play()

            setTimeout(() => {
                div.remove();
                sendData({ value: false }, 'ReceiveDialog')
            }, e.data.time);
        } else if (e.data.void === 'verifDialogExists') {
            const dialogElement = document.querySelector('.dialog');
            if (dialogElement) {
                dialogElement.remove()
                sendData({ value: true, key: e.data.key }, 'ReceiveDialogExists')
            }
        }
    });
});