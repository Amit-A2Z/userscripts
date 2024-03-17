// ==UserScript==
// @name         SAP Blogs
// @namespace    http://tampermonkey.net/
// @version      2024-02-07
// @description  try to take over the world!
// @author       You
// @match        https://community.sap.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=sap.com
// @grant        none
// ==/UserScript==
window.addEventListener('load', function() {
    'use strict';
    // Your code here...
    /*     let zToggle = document.getElementsByClassName("lia-quilt-column-alley-right");
    for (var i = 0; i < zToggle.length; i++) {
        zToggle[i].click();
    } */

    // Select all elements with the class name
    let right = document.getElementsByClassName("lia-quilt-column-alley-right");
    // Loop through the elements backwards and remove each one
    for (let i = right.length - 1; i >= 0; i--) {
        right[i].remove();
    };
    // Select all elements with the class name
    let hero = document.getElementsByClassName("lia-quilt-row-header-hero");
    // Loop through the elements backwards and remove each one
    for (let i = hero.length - 1; i >= 0; i--) {
        hero[i].remove();
    };
    // Remove all <br> tags
    document.querySelectorAll('br').forEach(el => el.remove());
    // Remove "lia-top-quilt" class from all divs
    document.querySelectorAll('div.lia-top-quilt').forEach(el => el.classList.remove('lia-top-quilt'));
    // Remove all divs with class "lia-quilt-row-message-main"
    // document.querySelectorAll('div.lia-page').forEach(el => el.remove());
    // document.querySelectorAll('div.MinimumWidthContainer').forEach(el => el.remove());
    // document.querySelectorAll('div.min-width-wrapper').forEach(el => el.remove());
    // document.querySelectorAll('div.min-width').forEach(el => el.remove());

    //document.querySelectorAll('div.lia-content').forEach(el => el.remove());
    //document.querySelectorAll('div.li-common-non-bindable').forEach(el => el.remove());
    //document.querySelectorAll('div.lia-quilt-layout-two-column-main-side').forEach(el => el.remove());
    // Remove "div.lia-quilt-layout-one-column" class from all divs
    document.querySelectorAll('div.lia-quilt-column-16').forEach(el => el.classList.remove('div.lia-quilt-column-16'));
    //document.querySelectorAll('div.lia-quilt-row-main').forEach(el => el.classList.remove('div.lia-quilt-row-main'));
    document.querySelectorAll('div.lia-quilt-layout-one-column').forEach(el => el.classList.remove('div.lia-quilt-layout-one-column'));
    document.querySelectorAll('div.lia-quilt-layout-one-column').forEach(el => el.classList.remove('div.lia-quilt-layout-two-column-main-side'));

    // Remove all divs with class "lia-quilt-row"
    document.querySelectorAll('div.CommentList').forEach(el => el.remove());
    document.querySelectorAll('div.lia-quilt-footer').forEach(el => el.remove());
    document.querySelectorAll('div.lia-quilt-row-footer').forEach(el => el.remove());
    document.querySelectorAll('div.lia-CommentEditor-form').forEach(el => el.remove());
    document.querySelectorAll('div.lia-quilt-column-side-content').forEach(el => el.remove());
    document.querySelectorAll('div.lia-discussion-page-sub-section-header').forEach(el => el.remove());
    // Function to recursively remove &nbsp; from all text nodes
    function removeNbsp(node) {
        if (node.nodeType === 3) { // Node.TEXT_NODE
            // Replace &nbsp; with regular space. Use an empty string '' to remove completely
            node.nodeValue = node.nodeValue.replace(/\u00A0/g, ' ');
        } else {
            node.childNodes.forEach(removeNbsp);
        }
    }

    // Apply the function to the body element to cover the whole document
    removeNbsp(document.body);
});
