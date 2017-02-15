const events = [
  {
    "occasion": "Birthday party",
    "invited_count": 120,
    "year": 2016,
    "month": 2,
    "day": 14
  },
  {
    "occasion": "Technical discussion",
    "invited_count": 23,
    "year": 2016,
    "month": 11,
    "day": 24
  },
  {
    "occasion": "Press release",
    "invited_count": 64,
    "year": 2015,
    "month": 12,
    "day": 17,
    "cancelled": true
  },
  {
    "occasion": "New year party",
    "invited_count": 55,
    "year": 2016,
    "month": 1,
    "day": 1
  }
];

document.addEventListener("DOMContentLoaded", function() {
  console.log("Hi, Intercom! :)");
  let eventList = document.getElementById('event-list');
  for (let i = 0; i < events.length; i++) {
    let currEvent = document.createElement('div');
    eventList.appendChild(currEvent);
    currEvent.className += "event";

    let eventTitle = document.createElement('div');
    eventTitle.className += "event-title";
    eventTitle.innerHTML = events[i]["occasion"];
    currEvent.appendChild(eventTitle);

    currEvent.addEventListener("mouseover", (e) => {
      let selectedEvent = document.getElementsByClassName('selected-event')[0];
      if (events[i]["cancelled"]) {
        selectedEvent.className += " cancelled";
      } else {
        selectedEvent.className = "selected-event";
      }

      let selectedTitle = document.getElementById('selected-title');
      selectedTitle.innerHTML = events[i]["occasion"];
      let dateString = "Date: " + events[i]["month"] + "/" + events[i]["day"] + "/" + events[i]["year"];
      let selectedDate = document.getElementById('selected-date');
      selectedDate.innerHTML = dateString;
      let selectedGuests = document.getElementById('selected-guests');
      selectedGuests.innerHTML = `Attending: ${events[i]["invited_count"]}`;
    });

  }
});
