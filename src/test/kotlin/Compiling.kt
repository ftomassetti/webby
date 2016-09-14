
import org.junit.Test
import java.io.RandomAccessFile
import java.text.SimpleDateFormat
import java.time.Instant
import java.util.*

class CompilingTests {

    fun Byte.toUnsignedInt() : Long {
        val res = this.toLong()
        if (res < 0) {
            return res + 256
        } else {
            return res
        }
    }

    fun toUnsignedInt(bytes: ByteArray): Long {
        val value = bytes[0].toUnsignedInt() + (bytes[1].toUnsignedInt() + (bytes[2].toUnsignedInt() + bytes[3].toUnsignedInt() * 256L) * 256L) * 256L
        return value
    }

    @Test
    fun readCompiledFile() {
        val fileName = "src/test/resources/hello.pyc"
        val f = RandomAccessFile(fileName, "r")
        val bytes = ByteArray(f.length().toInt())
        f.readFully(bytes)
        f.close()

        var timestamp = toUnsignedInt(bytes.sliceArray(IntRange(4,7)))
        val date = Date.from(Instant.ofEpochSecond(timestamp))
        println(SimpleDateFormat("dd/MM/yyyy' 'HH:mm:ss:S").format(date))
    }

    @Test
    fun writeCompiledFile() {
        val fileName = "hello_gen.pyc"
        val f = RandomAccessFile(fileName, "rw")
        val bytes = ByteArray(100)
        // magic number for python 2.7
        bytes[0] = 3
        bytes[1] = -13
        // this code is valid for all versions
        bytes[2] = 13
        bytes[3] = 10
        f.write(bytes)
        f.close()
    }

}
