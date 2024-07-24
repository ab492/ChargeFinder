package example.com.model

data class Home(
    val title: String,
    val items: List<HomeItem>,
)

data class HomeItem(
    val id: String,
    val title: String,
    val href: String
)

// Temporary!
fun HomeItem.taskAsRow() = """
    <tr>
        <td>$id</td><td>$title</td><td>$href</td>
    </tr>
    """.trimIndent()

fun List<HomeItem>.tasksAsTable() = this.joinToString(
    prefix = "<table rules=\"all\">",
    postfix = "</table>",
    separator = "\n",
    transform = HomeItem::taskAsRow
)