using System;
using System.Runtime.Serialization;

namespace DRP3_Project.CustomExceptions
{
    [Serializable]
    internal class EmployeeIdAlreadyExistsException : Exception
    {
        public EmployeeIdAlreadyExistsException()
        {
        }

        public EmployeeIdAlreadyExistsException(string message) : base(message)
        {
        }

        public EmployeeIdAlreadyExistsException(string message, Exception innerException) : base(message, innerException)
        {
        }

        protected EmployeeIdAlreadyExistsException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}