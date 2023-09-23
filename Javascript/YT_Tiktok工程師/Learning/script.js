//callback 回呼 告訴window完成事件後call function

window.addEventListener('load', function() {
    const p1 = this.document.getElementById('title')
    p1.innerText = "Welcome"

    const btn1 = this.document.getElementById('btn')

    btn1.addEventListener('click', function () {
        console.log('Click!')
    })

    const box1 = this.document.getElementById('box')
    box1.innerHTML = '<p>Test</p>'

    const inp1 = this.document.getElementById('input')
    inp1.addEventListener('keyup', function (event) {
        console.log('event.target.value', event.target.value)
    })

})