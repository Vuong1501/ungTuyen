function findDuplicates(arr) {
    const daGap = new Set();
    const trungLap = new Set();

    for (const num of arr) {
        if (daGap.has(num)) {
            trungLap.add(num);
        } else {
            daGap.add(num);
        }
    }

    return Array.from(trungLap);
}
console.log(findDuplicates([1, 2, 3, 4, 2, 5, 6, 3]));
console.log(findDuplicates([7, 8, 9, 10]));