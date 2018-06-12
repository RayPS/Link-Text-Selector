document.addEventListener('DOMContentLoaded', function(event) {
    // safari.extension.dispatchMessage('Document Loaded!');

    var hotKey = 'Shift';

    safari.extension.dispatchMessage('askForHotKey');

    safari.self.addEventListener('message', function (Event) {
        if (Event.name == 'answerForHotKey') {
            hotKey = Event.message.hotKey || 'Shift';
        }
    }, false);
    
    document.addEventListener('keyup', (event) => {
        if (event.key == hotKey) {
            let target = document.querySelector('a:hover');
            if (target) {
                let box = makeBoxElement(target);
                document.body.appendChild(box);
                box.show();
            }
        }
    });
});


function makeBoxElement(element) {
    let offset = 8;

    let div = document.createElement('div');
    div.innerHTML = element.innerHTML;

    let rect = element.getBoundingClientRect();
    let expandedBounding = {
        left: rect.left - offset + window.scrollX,
        top: rect.top - offset + window.scrollY,
        width: rect.width + offset * 2,
        height: rect.height + offset * 2
    };
    for (let key in expandedBounding) {
        expandedBounding[key] += 'px';
    }

    let computedStyle = window.getComputedStyle(element);

    let style = {
        'position': 'absolute',
        'z-index': 2147483647, // Literally the maximum number LOL..;
        'background-color': 'white',
        'font': computedStyle.font,
        // 'line-height': computedStyle.lineHeight,
        'color': 'black',
        'padding-left': offset + parseInt(computedStyle.paddingLeft) + 'px',
        'padding-top': offset + parseInt(computedStyle.paddingTop) + 'px',
        'box-sizing': 'border-box',
        'border-radius': '4px',
        'box-shadow': '0px 0px 0px 1px rgba(0 ,0, 0, 0.1), 0px 4px 8px rgba(0 ,0, 0, 0.25), 0px 8px 16px rgba(0 ,0, 0, 0.25)',
        'cursor': 'text',
        'transition': 'transform 0.1s ease-out, opacity 0.1s ease-in',
        'transform': 'scale(1)'
    };
    style = Object.assign(style, expandedBounding);

    for (let key in style) {
        div.style.setProperty(key, style[key], 'important');
    }

    div.querySelectorAll('*').forEach( x => {
        x.style.cursor = 'text';
    });

    div.show = function(){
        setTimeout(function(){
            div.style.transform = 'scale(1.1)';
            setTimeout(function(){
                div.style.transform = 'scale(1)';
            },100);
        },50);
    };

    div.addEventListener('mouseleave', function(){
        div.style.opacity = 0;
        setTimeout(function(){
            div.parentNode.removeChild(div);
        },100);
    });

    return div;
}