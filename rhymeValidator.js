function validateRhymeScheme(scheme) {
    const blocks = scheme.split(" ");
    const isValidBlock = (block) => {
        if (![2, 4, 6].includes(block.length)) return false;

        const rhymeMap = {};
        for (const char of block) {
            rhymeMap[char] = (rhymeMap[char] || 0) + 1;
        }

        return Object.values(rhymeMap).every((count) => count === 2);
    };

    return blocks.every(isValidBlock);
}

// Example usage:
const scheme = "ABBA CDCD";
console.log(validateRhymeScheme(scheme)); // true or false
