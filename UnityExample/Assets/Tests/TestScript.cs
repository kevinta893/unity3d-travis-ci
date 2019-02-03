using UnityEngine;
using UnityEngine.TestTools;
using NUnit.Framework;
using System.Collections;

public class TestScript
{

    [Test]
    public void TestScript_SimplePasses()
    {
        // Use the Assert class to test conditions.
        var expected = true;
        var actual = true;
        Assert.AreEqual(expected, actual);
    }

    [Test]
    public void TestScript_ThrowException()
    {
        var gameObject = new GameObject("TestObject_TestScript_ThrowException()");

        Assert.Throws<MissingComponentException>(
            () => gameObject.GetComponent<Rigidbody>().velocity = Vector3.one
        );
    }

    // A UnityTest behaves like a coroutine in PlayMode
    // and allows you to yield null to skip a frame in EditMode
    [UnityTest]
    public IEnumerator TestScriptWithEnumeratorPasses()
    {
        // Use the Assert class to test conditions.
        // yield to skip a frame
        yield return null;
    }
}
