const alphabet = "abl^$ù!,;:!+²oçà)=def] }ghiqcr{[|`\\^@spuvwxyz&é('-è_¤<>/*-mnt~#jk";

const createMatch = () => {
    const match = {};
    for (let i = 0; i < alphabet.length; i++) {
        match[alphabet[i]] = alphabet[alphabet.length - 1 - i];
    }
    return match;
};

const match = createMatch();


const transform = (text) => {
    let result = "";

    for (let char of text) {
        if (match[char] !== undefined) {
            result += match[char];
        } else {
            result += char;
        }
    }

    return result;
};

const passwordHash = (password) => transform(password);
const reverseHash = (password) => transform(password);

export { passwordHash, reverseHash };
