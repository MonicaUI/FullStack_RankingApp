
import React, { useEffect, useState } from 'react';

const RankItems = () => {

    const [items, setItems] = useState([]);
    const dataType = 1;

    useEffect(() => {
        fetch(`item/${dataType}`)
            .then((results) => {
                return results.json();
            })
            .then(data => {

                setItems(data);
            })
    }, [])

    return (
        <main>
            {items.map((item) => (
                <div> {item.title}</div>
            ))         }
        </main>
    )

}

export default RankItems