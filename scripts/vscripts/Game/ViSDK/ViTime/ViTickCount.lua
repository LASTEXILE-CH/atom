-- export class DateStruct
-- {
-- 	Week: number;
-- 	Day: number;
-- 	Hour: number;
-- 	Minute: number;
-- 	Second: number;
-- }

-- export class ViTickCount
-- {
-- 	public static readonly SECOND: number = 100;
-- 	public static readonly MINUTE: number = ViTickCount.SECOND * 60;
-- 	public static readonly HOUR: number = ViTickCount.MINUTE * 60;
-- 	public static readonly DAY: number = ViTickCount.HOUR * 60;
-- 	public static readonly WEEK: number = ViTickCount.DAY * 60;
-- 	public static readonly time1970: Date = new Date(1970, 1, 1);

-- 	public static GetCount(second: number, minute?: number, hour?: number, day?: number, week?: number): number
-- 	{
-- 		let count = second * ViTickCount.SECOND;
-- 		if (minute)
-- 		{
-- 			count += minute * ViTickCount.MINUTE;
-- 		}
-- 		if (hour)
-- 		{
-- 			count += hour * ViTickCount.HOUR;
-- 		}
-- 		if (day)
-- 		{
-- 			count += day * ViTickCount.DAY;
-- 		}
-- 		if (week)
-- 		{
-- 			count += week * ViTickCount.WEEK;
-- 		}
-- 		return count;
-- 	}

-- 	public static GetTime(count: number): DateStruct
-- 	{
-- 		let result = new DateStruct();
-- 		let reserveCount = count + 50;
-- 		result.Week = ViAssisstant.IntInf(reserveCount / ViTickCount.WEEK);
-- 		reserveCount -= result.Week * ViTickCount.WEEK;
-- 		result.Day = ViAssisstant.IntInf(reserveCount / ViTickCount.DAY);
-- 		reserveCount -= result.Day * ViTickCount.DAY;
-- 		result.Hour = ViAssisstant.IntInf(reserveCount / ViTickCount.HOUR);
-- 		reserveCount -= result.Hour * ViTickCount.HOUR;
-- 		result.Minute = ViAssisstant.IntInf(reserveCount / ViTickCount.MINUTE);
-- 		reserveCount -= result.Minute * ViTickCount.MINUTE;
-- 		result.Second = ViAssisstant.IntInf(reserveCount / ViTickCount.SECOND);
-- 		return result;
-- 	}
-- }