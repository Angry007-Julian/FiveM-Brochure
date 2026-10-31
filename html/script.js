const overlay = document.getElementById('overlay');
const image = document.getElementById('image');
let open = false;

function show(src) {
    image.src = src;
    overlay.style.display = 'block';
    open = true;
}

function hide() {
    overlay.style.display = 'none';
    image.src = '';
    open = false;
}

function requestClose() {
    if (!open) return;
    hide();
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json; charset=UTF-8' },
        body: '{}'
    });
}

window.addEventListener('message', (event) => {
    const data = event.data;
    if (data.action === 'open') show(data.image);
    else if (data.action === 'close') hide();
});

document.getElementById('close').addEventListener('click', requestClose);

document.addEventListener('keyup', (e) => {
    if (e.key === 'Escape' || e.key === 'Backspace') requestClose();
});
