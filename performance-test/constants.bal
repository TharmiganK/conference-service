import ballerina/lang.regexp;

regexp:RegExp timeRegex = re `\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}\+\d{2}:\d{2}|\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d+Z`;
regexp:RegExp memoryRegex = re `(\d+(\.\d+)?)`;
