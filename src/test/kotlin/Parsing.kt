import me.tomassetti.webby.parsing.WebbyAntlrParserFacade
import org.junit.Test
import kotlin.test.assertEquals

class ParsingTests {

    @Test
    fun parseEmptyFile() {
        val code = ""
        val res = WebbyAntlrParserFacade.parse(code)
        assertEquals(0, res.errors.size, res.errors.joinToString(", "))
    }

    @Test
    fun parseSimpleExample() {
        val code = """GET /Validate:
                     |    reply OK ''
                     |""".trimMargin("|")
        val res = WebbyAntlrParserFacade.parse(code)
        assertEquals(0, res.errors.size, res.errors.joinToString(", "))
    }

    @Test
    fun parseRequiredHeader() {
        val code = """GET /Validate:
                     |    val token = req header auth-token
                     |    reply OK ''
                     |""".trimMargin("|")
        val res = WebbyAntlrParserFacade.parse(code)
        assertEquals(0, res.errors.size, res.errors.joinToString(", "))
    }

}
