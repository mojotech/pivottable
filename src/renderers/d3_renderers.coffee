$ = jQuery

$.pivotUtilities.d3_renderers = Treemap: (pivotData, opts) ->
    defaults =
        localeStrings: {}

    opts = $.extend defaults, opts


    result = $("<div style='width: 100%; height: 100%;'>")

    tree = name: "All", children: []
    addToTree = (tree, path, value) ->
        if path.length == 0
            tree.value = value
            return
        tree.children ?= []
        x = path.shift()
        for child in tree.children when child.name == x
            addToTree(child, path, value)
            return
        newChild = name: x
        addToTree(newChild, path, value)
        tree.children.push newChild

    for rowKey in pivotData.getRowKeys()
        value = pivotData.getAggregator(rowKey, []).value()
        if value?
            addToTree(tree, rowKey, value[0])

    color = d3.scale.category10()
    width = $(window).width() / 1.4
    height = $(window).height() / 1.4
    margin = 10

    treemap = d3.layout.treemap()
        .size([width, height])
        .sticky(true)
        .value( (d) -> d.size )

    d3.select(result[0])
        .append("div")
            .style("position", "relative")
            .style("width", (width + margin*2) + "px")
            .style("height", (height + margin*2) + "px")
            .style("left", margin + "px")
            .style("top", margin + "px")
        .datum(tree).selectAll(".node")
            .data(treemap.padding([15,0,0,0]).value( (d) -> d.value ).nodes)
        .enter().append("div")
          .attr("class", "node")
          .style("background", (d) -> if d.children? then "lightgrey" else color(d.name) )
          .text( (d) -> d.name )
          .call ->
                this.style("left",  (d) -> d.x+"px" )
                    .style("top",   (d) -> d.y+"px" )
                    .style("width", (d) -> Math.max(0, d.dx - 1)+"px" )
                    .style("height",(d) -> Math.max(0, d.dy - 1)+"px" )
                return

    return result
