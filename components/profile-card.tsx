// import { gql } from "../gql";
// import { ProfileCard_UserFragment } from "../gql/graphql";
// import { gql } from "@apollo/client";
// import { FragmentType } from "../gql";

type ProfileCardProps = {} & any;

export function ProfileCard({ id, name, arrayItem }: ProfileCardProps) {
  return (
    <div>
      <h1>{name}</h1>
      <p>id: {id}</p>
      <p>arrayItem: {arrayItem}</p>
    </div>
  );
}

// ProfileCard.fragments = {
//   // viewer: gql(`
//   //   fragment ProfileCard_User on User {
//   //     id
//   //     name
//   //     arrayItem
//   //   }
//   // `),
//   viewer: gql(`
//     fragment ProfileCard_User on User
//       @argumentDefinitions(id: {type: "ID", defaultValue: "a123"}) {
//       id
//       name
//       arrayItem(id: $id)
//     }
//   `),
// };
