var liked = document.querySelectorAll('#liked');
var unliked = document.querySelectorAll('#unliked');
var size = liked.length;
for (let i = 0; i < size; i++) {
    unliked[i].addEventListener('click', function () {
        console.log(i)
        liked[i].style.display = 'block';
        unliked[i].style.display = 'none';
    });
}
for (let i = 0; i < size; i++) {
    liked[i].addEventListener('click', function () {
        liked[i].style.display = 'none'
        unliked[i].style.display = 'block';
    });
}/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


