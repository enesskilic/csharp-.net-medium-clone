const editor = document.getElementById("editor");
const title = document.getElementById("title");
const block = document.querySelector(".block");
const block_list = document.querySelector("#block-list");
const block_content = document.querySelector(".block-content");

// Add Block
const createBlock = async () => {
    const block = await document.createElement("div");
    const block_content = await document.createElement("p");
    const block_settings = await document.createElement("div");
    const block_settings_expand = await document.createElement("div");

    await block.setAttribute("class", "block");
    await block_content.setAttribute("class", "block-content");
    await block_content.setAttribute("contenteditable", "true");
    await block_content.setAttribute("data-text", "...");
    await block_content.setAttribute("onfocus", "removeAttr(this)");
    await block_content.setAttribute("onblur", "addAttr(this)");
    await block_settings.setAttribute("class", "block-settings");
    await block_settings_expand.setAttribute("class", "block-settings-expand");
    await block_settings_expand.setAttribute("onclick", "expand_settings(this)");

    block_settings_expand.innerHTML = await settings_icon;

    await block.appendChild(block_settings);
    await block_settings.appendChild(block_settings_expand);
    block_settings.innerHTML += await block_settings_list_html;
    await block.appendChild(block_content);
    await block_list.appendChild(block);
    block_content.focus();
};
//Remove Block
const removeBlock = async () => {
    var block_content = block_list.lastElementChild.querySelector(".block-content");

    if (block_content.innerText.length <= 0 && document.querySelectorAll('.block').length > 1) {
        await block_list.removeChild(block_list.lastElementChild);
    }
};
//Detect KeyPress
const keyPress = (e) => {
    if (e.keyCode === 13) {
        e.preventDefault();
        createBlock();
    } else if (e.keyCode === 8) {
        removeBlock();
    }
}
editor.addEventListener("keydown", (e) => keyPress(e));

//Settings
const setSubTitle = async (el) => {
    await el.parentNode.parentNode.parentNode
        .querySelector(".block-content")
        .classList.toggle("subtitle");
    expand_settings(el.parentNode);
    return false
};
const setBold = async (el) => {
    await el.parentNode.parentNode.parentNode
        .querySelector(".block-content")
        .classList.toggle("bold");
    expand_settings(el.parentNode);
    return false
};
const setItalic = async (el) => {
    await el.parentNode.parentNode.parentNode
        .querySelector(".block-content")
        .classList.toggle("italic");
    expand_settings(el.parentNode);
    return false
};
//Print
const printText = async () => {
    const area = document.getElementById('post_content')
    var block_list = await document.querySelectorAll('.block')
    var arr = [];

    await (document.getElementById('post_title').value = title.innerText);

    for (var i = 0; i < block_list.length; i++) {
        await block_list[i].removeChild(block_list[i].firstElementChild)
        await block_list[i].querySelector('.block-content').removeAttribute('contenteditable')
        await block_list[i].querySelector('.block-content').removeAttribute('onfocus')
        await block_list[i].querySelector('.block-content').removeAttribute('onblur')
        await arr.push(block_list[i].innerHTML)
    }
    for (var j = 0; j < arr.length; j++) {
        area.value += arr[j]
    }
    if (area.value.length > 0 && document.getElementById('post_title').value > 0) {
        return true;
    } else {
        return false;
    }
}
//Utils
editor.addEventListener("paste", function (e) {
    e.preventDefault();
    var text = (e.originalEvent || e).clipboardData.getData("text/plain");
    document.execCommand("insertHTML", false, text);
});
title.onfocus = () => {
    title.removeAttribute("data-text");
};
title.onblur = () => {
    if (title.innerText.length <= 0) title.setAttribute("data-text", "...");
};
title.addEventListener("keydown", (e) => {
    if (e.keyCode === 13) {
        e.preventDefault();
        editor.lastElementChild.querySelector(".block-content").focus();
    }
});
const removeAttr = (el) => {
    el.removeAttribute("data-text");
};
const addAttr = (el) => {
    if (el.innerText.length <= 0) el.setAttribute("data-text", "...");
};
const expand_settings = (el) => {
    el.parentNode.parentNode.classList.toggle("show");
};
const settings_icon = `
<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path d="M18 6L6 18" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" />
                                    <path d="M6 6L18 18" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" />
                                </svg>
`;
const block_settings_list_html = `
<ul class="block-settings-list">
                                <button class="block-settings-btn" onclick="setSubTitle(this);return false;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="feather feather-type">
                                        <polyline points="4 7 4 4 20 4 20 7"></polyline>
                                        <line x1="9" y1="20" x2="15" y2="20"></line>
                                        <line x1="12" y1="4" x2="12" y2="20"></line>
                                    </svg>
                                </button>
                                <button class="block-settings-btn" onclick="setBold(this);return false;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="feather feather-bold">
                                        <path d="M6 4h8a4 4 0 0 1 4 4 4 4 0 0 1-4 4H6z"></path>
                                        <path d="M6 12h9a4 4 0 0 1 4 4 4 4 0 0 1-4 4H6z"></path>
                                    </svg>
                                </button>
                                <button class="block-settings-btn" onclick="setItalic(this);return false;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                        fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                        stroke-linejoin="round" class="feather feather-italic">
                                        <line x1="19" y1="4" x2="10" y2="4"></line>
                                        <line x1="14" y1="20" x2="5" y2="20"></line>
                                        <line x1="15" y1="4" x2="9" y2="20"></line>
                                    </svg>
                                </button>
                            </ul>
`;

// === Update  Post
var contentArray = []
var blockArray = []
// Convert Data to HTML
const initPost = () => {
    title.removeAttribute("data-text")
    title.innerText = document.getElementById("current_title").value
    block_list.innerHTML = document.getElementById("current_block_list").value
    for (let i = 0; i < block_list.childElementCount; i++) {
        block_list.children[i].setAttribute("contenteditable", "true")
        contentArray.push(block_list.children[i])
    }
}
// Insert Converted Data into Block
const initUpdatablePost = () => {
    var block;
    var block_settings;
    var block_settings_expand;

    function createSettingsExpand() {
        block_settings_expand = document.createElement("div")
        block_settings_expand.setAttribute("class", "block-settings-expand");
        block_settings_expand.setAttribute("onclick", "expand_settings(this)");
        block_settings_expand.innerHTML = settings_icon;
        return block_settings_expand
    }
    function createSettings(expand) {
        block_settings = document.createElement("div")
        block_settings.setAttribute("class", "block-settings");
        block_settings.appendChild(expand)
        block_settings.innerHTML += block_settings_list_html
        return block_settings

    }
    function createBlock(settings) {
        expand = createSettingsExpand()
        settings = createSettings(expand)
        block = document.createElement("div")
        block.setAttribute("class", "block");
        block.appendChild(settings)
        return block
    }

    let el;
    for (let j = 0; j < contentArray.length; j++) {
        el = createBlock()
        el.appendChild(contentArray[j])
        block_list.appendChild(el)
    }
}

if (window.location.pathname.includes("edit")) {
    initPost()
    initUpdatablePost();
}