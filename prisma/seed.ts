import { Prisma, PrismaClient } from "@prisma/client";

const client = new PrismaClient();

const getSocialMedia = (): Prisma.socialMediaCreateInput[] => [
  {
    name: "LinkedIn",
  },
  {
    name: "Facebook",
  },
  {
    name: "Twitter",
  },
  {
    name: "Instagram",
  },
];

const main = async () => {
  const socialMedia = await Promise.all(
    getSocialMedia().map((social) => client.socialMedia.create({ data: social }))
  );
};

main();
