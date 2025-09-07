import axios from "axios";

export const axiosInstance = axios.create({
  baseURL:
    import.meta.env.MODE === "development"
      ? "http://localhost:5001/api"          // Local dev
      : "http://52.66.172.165:5001/api",   // EC2 prod
  withCredentials: true,
});
