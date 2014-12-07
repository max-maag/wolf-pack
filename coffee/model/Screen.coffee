class @Screen
  @width: Math.max(
    document.documentElement?.clientWidth or 0
    document.body?.scrollWidth or 0
    document.documentElement?.scrollWidth or 0
    document.body?.offsetWidth or 0
    document.documentElement?.offsetWidth or 0
  )

  @height: bodyHeight = Math.max(
    document.documentElement?.clientHeight or 0
    document.body?.scrollHeight or 0
    document.documentElement?.scrollHeight or 0
    document.body?.offsetHeight or 0
    document.documentElement?.offsetHeight or 0
  )
