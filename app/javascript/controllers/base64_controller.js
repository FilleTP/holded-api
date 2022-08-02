// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {

//   // static targets = ['src']

//   connect() {
//     this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")

//   }


//   send(event) {
//     event.preventDefault()
//     console.log("HEELO")

//     fetch(this.formTarget.action, {
//       method: "PATCH",
//       headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
//       body: new FormData(this.formTarget)
//     })
//       .then(response => response.json())
//       .then((data) => {
//         console.log(data)
//       })
//   }
// }
