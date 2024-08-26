import { PrismaClient } from "@prisma/client";

// Instantiate Prisma Client
const prisma = new PrismaClient();

async function main() {
}

// Run the `main` function
main().catch((e) => {
    console.error(e);
}).finally(async () => {
    // Disconnect Prisma Client
    await prisma.$disconnect();
});
