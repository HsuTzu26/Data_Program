const morseCodeDict = {
    'A': '.-',    'B': '-...',  'C': '-.-.',  'D': '-..',
    'E': '.',     'F': '..-.',  'G': '--.',   'H': '....',
    'I': '..',    'J': '.---',  'K': '-.-',   'L': '.-..',
    'M': '--',    'N': '-.',    'O': '---',   'P': '.--.',
    'Q': '--.-',  'R': '.-.',   'S': '...',   'T': '-',
    'U': '..-',   'V': '...-',  'W': '.--',   'X': '-..-',
    'Y': '-.--',  'Z': '--..',  '1': '.----', '2': '..---',
    '3': '...--', '4': '....-', '5': '.....', '6': '-....',
    '7': '--...', '8': '---..', '9': '----.', '0': '-----',
    ', ': '--..--', '.': '.-.-.-', '?': '..--..', '/': '-..-.', '-': '-....-', '(': '-.--.', ')': '-.--.-'
};

document.getElementById('translateToMorse').addEventListener('click', function() {
    var input = document.getElementById('inputText').value;
    document.getElementById('output').textContent = translateToMorse(input);
});

document.getElementById('translateToText').addEventListener('click', function() {
    var input = document.getElementById('inputText').value;
    document.getElementById('output').textContent = translateToText(input);
});

function translateToMorse(text) {
    return text.toUpperCase().split('').map(function(letter) {
        return morseCodeDict[letter] ? morseCodeDict[letter] : letter;
    }).join(' ');
}

function translateToText(morse) {
    return morse.split(' ').map(function(code) {
        return Object.keys(morseCodeDict).find(key => morseCodeDict[key] === code) || code;
    }).join('');
}

document.addEventListener('DOMContentLoaded', () => {
    const playButton = document.querySelector('.btn.play');
    const dotAudio = document.getElementById('dot');
    const dashAudio = document.getElementById('dash');

    playButton.addEventListener('click', () => {
        const morseCode = document.getElementById('output').innerText;
        playMorseCode(morseCode);
    });

    function playMorseCode(morseCode) {
        let index = 0;
        let morseCodeArray = morseCode.split(' '); // 將摩斯密碼按空格分隔

        function playNext() {
            if (index < morseCodeArray.length) {
                let word = morseCodeArray[index];
                playWord(word, () => {
                    // 在字母間停頓 3 秒，在單詞間停頓 7 秒
                    let delay = word === '/' ? 7000 : 3000; 
                    setTimeout(playNext, delay);
                });
                index++;
            }
        }

        playNext();
    }

    function playWord(word, callback) {
        let charIndex = 0;

        function playChar() {
            if (charIndex < word.length) {
                let char = word[charIndex];
                if (char === '.') {
                    dotAudio.play();
                } else if (char === '-') {
                    dashAudio.play();
                }
                charIndex++;
                // 調整每個摩斯碼字符之間的停頓
                setTimeout(playChar, 500); 
            } else {
                callback();
            }
        }

        playChar();
    }
});


