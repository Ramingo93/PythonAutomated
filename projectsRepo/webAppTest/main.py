# python template file 

# importing libraries
from flet import *
from custom_checkbox import CustomCheckBox

# main function
def main(page: Page):
  BG = "#041955" #background
  FWG = "#97b4ff"
  FG = "#3450a1" #foreground
  PINK = "#eb06ff"

  def shrink(e):
     page_2.controls[0].width = 120
     page_2.controls[0].scale = transform.Scale(
        0.8, alignment.center_right
        )
##     page_2.controls[0].border_radius = border_radius.only(
##        topLeft = 35,
##        topRight = 0,
##        bottomLeft = 35,
##        bottomRight = 0,
##        )
     page_2.update()
  
  def restore(e):
     page_2.controls[0].width = 400
     page_2.controls[0].scale = transform.Scale(
        1, alignment.center_right
        )
     page_2.update()
  
  create_task_view = Container(
    content = Container(on_click=lambda _:page.go('/'),
      height=40,
      width=40,
      content=Text('x')
      )
    )


  tasks = Column(
    height = 400,
    scroll = 'auto',
    )

  for i in range(10):
    tasks.controls.append(
      Container(
         height=50,
         width=400,
         bgcolor=BG,
         border_radius=25,
         padding = padding.only(
            left=20, top=15,
            ),
         content = CustomCheckBox(
            color = PINK,
            #size = 30,
            label = 'Create interesting content!'
            ),
         ),
      )
    
  categories_card = Row(
    scroll = 'auto'
    )

  categories = ['Business', 'Family', 'Friends']
  for i, category in enumerate(categories):
    categories_card.controls.append(
      Container(
        border_radius = 20,
        bgcolor = BG,
        height = 110,
        width = 170,
        padding = 15,
        content = Column(
          controls = [
            Text('40 Tasks'),
            Text(category),
            Container(
              width = 160,
              height = 5,
              bgcolor = 'white12',
              border_radius = 20,
              padding = padding.only(right = i*30),
              content = Container(
                 bgcolor = PINK,
                )
              )
            ]
          )
        )
      )
  
  first_page_contents = Container(
    content = Column(
      controls = [
        Row(alignment = "spaceBetween",
          controls = [
            Container(on_click = lambda e: shrink(e),
              content = Icon(
                icons.MENU)),
            Row(
              controls = [
                Icon(icons.SEARCH),
                Icon(icons.NOTIFICATIONS_OUTLINED)
                ],
              ),
            ],
          ),
        Container(height=20),
        Text(
          value = 'What\'s up, Olivia!'
          ),
        Text(
          value = 'CATEGORIES'
          ),
        Container(
          padding = padding.only(top=10, bottom=20,),
          content = categories_card
          ),
        Container(height = 20),
        Text("TODAY'S TASKS"),
        Stack(
          controls = [
            tasks,
            FloatingActionButton(bottom=2, right=20,
              icon = icons.ADD,
              on_click=lambda _: page.go('/create_task')
              )
            ]
          )
        ],
      ),
    )

  page_1 = Container(
     width = 400,
     height = 850,
     bgcolor = BG,
     border_radius = 35,
     padding = padding.only(left = 50, top = 60, right = 200),
     
     content = Column(
        controls = [
           Container(
              border_radius = 25,
              padding = padding.only(top = 13, left = 13),
              height = 50,
              width = 50,
              border = border.all(color = 'white', width = 1),
              on_click = lambda e: restore(e),
              content = Text('<')
              )
           ]
        )
     )
  page_2 = Row(alignment = 'end',
    controls = [
      Container(
        width = 400,
        height = 850,
        bgcolor = FG,
        border_radius = 35,
        animate = animation.Animation(600, AnimationCurve.DECELERATE),
        animate_scale = animation.Animation(400, curve = 'decelerate'),
        padding = padding.only(
          top = 50,
          left = 20,
          right = 20,
          bottom = 5
          ),
        content = Column(
          controls = [
            first_page_contents
            ]
          )
        )
      ]
    )
  
  container = Container(
    width = 400,
    height = 850,
    bgcolor = BG,
    border_radius = 35,
    content = Stack(
      controls = [
        page_1,
        page_2
        ]
      )
    )
  
  pages = {
    '/':View(
      "/",
      [
        container
        ],
      ),
    '/create_task':View(
      "/create_task",
      [
        create_task_view
        ],
      )
    }


  def route_change(route):
    page.views.clear()
    page.views.append(
      pages[page.route]
      )
  
  page.add(container)

  page.on_route_change = route_change
  page.go(page.route)

# run the code only if this code is run directly from this very file, and not when imported into another project
app(target=main)
