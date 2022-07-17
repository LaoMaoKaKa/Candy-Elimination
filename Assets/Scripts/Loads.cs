using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class Loads : MonoBehaviour,IPointerClickHandler
{

    private TextAsset Gk1;
    private Image Gz1;
    private Image Gz2;
    public Transform GzPlane;
    public Image[] Candys;
    private Vector3[,] GzPoints = new Vector3[11, 9];

    // Start is called before the first frame update
    void Start()
    {

       /*
        Gz1 = Resources.Load<Image>("Gz1");
        Gz2 = Resources.Load<Image>("Gz2");

        Gk1 = Resources.Load<TextAsset>("Gk1");
        Debug.Log(Gk1.text);
        string[] HNum = Gk1.text.Split('\n');
        Debug.Log(HNum.Length);
        for (int i = 0; i < 11; i++)
        {
            for (int j = 0; j < 9; j++)
            {
                GzPoints[i, j] = new Vector3(j * 82 - 8 * 82 / 2, i * 82 - 10 * 82 / 2, 0);
            }
        }

        for (int i = 0; i < HNum.Length; i++)
        {
            string[] Nums = HNum[i].Split(',');

            for (int j = 0; j < Nums.Length; j++)
            {
                if (!Nums[j].Contains("-"))
                {
                    // Debug.Log(Nums[j]);
                    Random.Range(0,6);
                    Image Gz = Instantiate(Gz1, GzPlane);
                    Gz.GetType();
                    Gz.GetComponent<RectTransform>().localPosition = GzPoints[Mathf.Abs(i - 10), j];
                    Image Candyls = Instantiate(Candys[Random.RandomRange(0, 6)], GzPlane);
                    Candyls.GetComponent<RectTransform>().localPosition = GzPoints[Mathf.Abs(i - 10), j];
                }


            }
        }
        */
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButtonDown(1)) {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hi;
            bool isc = Physics.Raycast(ray, out hi, 100,1 << LayerMask.NameToLayer("Fk"));
            if (isc) {
                Destroy(hi.transform.gameObject);
                //Debug.Log(hi.transform.gameObject.name);
            }
        }
       
    }

    void IPointerClickHandler.OnPointerClick(PointerEventData eventData)
    {
        //Debug.Log("点击！");
    }
}
