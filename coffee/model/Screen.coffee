class Screen
  @width: Math.max(
    document.documentElement?['clientWidth']
    document.body?['scrollWidth']
    document.documentElement?['scrollWidth']
    document.body?['offsetWidth']
    document.documentElement?['offsetWidth']
  )

  @height: bodyHeight = Math.max(
    document.documentElement?['clientHeight']
    document.body?['scrollHeight']
    document.documentElement?['scrollHeight']
    document.body?['offsetHeight']
    document.documentElement?['offsetHeight']
  )
