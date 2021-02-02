function home (){
  const leftTag = document.getElementById("left_tag");
  const centerTag = document.getElementById("center_tag");
  const rightTag = document.getElementById("right_tag");
  const TopCalendar = document.getElementById("top_calendar");

  leftTag.addEventListener('mouseover', function(){
    this.setAttribute("style", "opacity: 0.9;");
  });
  leftTag.addEventListener('mouseout', function (){
    this.removeAttribute("style", "opacity: 0.9;");
  });
  centerTag.addEventListener('mouseover', function(){
    this.setAttribute("style", "opacity: 0.9;");
  });
  centerTag.addEventListener('mouseout', function(){
    this.removeAttribute("style", "opacity: 0.9;");
    });
  rightTag.addEventListener('mouseover', function(){
    this.setAttribute("style", "opacity: 0.9;");
  });
  rightTag.addEventListener('mouseout', function (){
    this.removeAttribute("style", "opacity: 0.9;");
  });
  TopCalendar.addEventListener('mouseover', function(){
    this.setAttribute("style", "opacity: 1.0;");
  });
  TopCalendar.addEventListener('mouseout', function(){
    this.removeAttribute("style", "opacity: 1.0;");
  });
}

setInterval(home, 1000);