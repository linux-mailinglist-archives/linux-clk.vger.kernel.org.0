Return-Path: <linux-clk+bounces-17415-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8720AA1C54A
	for <lists+linux-clk@lfdr.de>; Sat, 25 Jan 2025 22:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C3191886E0C
	for <lists+linux-clk@lfdr.de>; Sat, 25 Jan 2025 21:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774C920468C;
	Sat, 25 Jan 2025 21:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="gU/XTUY5"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7589218E2A
	for <linux-clk@vger.kernel.org>; Sat, 25 Jan 2025 21:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737840553; cv=none; b=TTEMs8n4IqwJ80UiZ20F/xcZ4Pxqk2u21jA+u0lqMHSBjQZCB5lqLUwQwYFdpaM08zhEkqPb5dLhT4cqNdIr/1d91gIo9FHxI0jrkt3AmLL76VdjWz0HFI7l+VSLHcfTi/XUDwVp88cdIgSW4AWhzHz4viz6l5U60WPyPEgtT8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737840553; c=relaxed/simple;
	bh=NM9R4AEFHYfq5k9ExvyYEZKAJ2zvHEerEs3wJuX/PxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bcv1v0JJKceW+3YB2XzAYGn6sDh0r07Q5nEVPFcoN07f5sHOWHppyVY861ZFRE1DkXOMJrNFPEkcPieRJQH+8THx8qH9f31QoQhD1nGUphnWLZcS7aZLGE9lZv/d4NboYUrFGC3OTaMHuu0oltePL06g61CzBs1uhh2Xt77QKbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=gU/XTUY5; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1737840545;
 bh=PLiub32TzGOVCaRQu14Q2l8GT6j31oGwqg3AtHjXG9A=;
 b=gU/XTUY5ztPo8cAbTDVmoZmgkY6P6B0vFiXJjwVzpsdRplcx8zi+vFoKxTN4BdnuPOdA91xoq
 Bct+Kf0IcATcQ5lF1aucZkxzR834GAWMdC7uennRBaASFIFzA54a2Xk157hsydli2gYU9/RNWuU
 WarmiYPhMTy+jriIrXCFoA28279gCzuSi8TsqmeipBArhJexmZdeiPsRkGWC7Y1bGQqfiyNmz6B
 W76DwEWF3JfXsTanFALfaGKa7B3KHtuJtFiw3J05yTqHt/chyXF8ONuMfCxUBWvz8T2Li0W5Fon
 RJI9/sfVjjW6h5HEEuxrvqME+cTxqmQuC6XNh8mcqVYg==
X-Forward-Email-ID: 6795578c58390289d47a0c06
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e0bef56d-0777-4467-8ddc-3b8b23d7ac21@kwiboo.se>
Date: Sat, 25 Jan 2025 22:28:39 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Revert "clk: rockchip: Set parent rate for
 DCLK_VOP clock on RK3228"
To: Elaine Zhang <zhangqing@rock-chips.com>, Alex Bee <knaerzche@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, kever.yang@rock-chips.com,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250125011545.15547-1-zhangqing@rock-chips.com>
 <20250125011545.15547-2-zhangqing@rock-chips.com>
 <8752cfda-b90a-4296-a08b-054b177aa586@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <8752cfda-b90a-4296-a08b-054b177aa586@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Elaine,

On 2025-01-25 06:38, Alex Bee wrote:
> Hi Elaine,
> 
> Am 25.01.25 um 02:15 schrieb Elaine Zhang:
>> This reverts commit 1d34b9757523c1ad547bd6d040381f62d74a3189.
>>
>> RK3228 Only GPLL and CPLL, GPLL is a common clock, does not allow
>> dclk_vop to change its frequency, CPLL is used by GMAC,
>> if dclk_vop use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT flags will
>> affect the GMAC function.
>>
> how do you come to this conclusion?
> 
> On the RK3228, hdmiphy is the default parent of dclk_vop, a clock that is
> not even generated by the CRU but is the output of an external HDMI PHY.
> The CLK_SET_RATE_NO_REPARENT flag ensures that the parent of dclk_vop never
> changes to sclk_vop_pre (and thus never uses CPLL or GPLL). With
> CLK_SET_RATE_PARENT we only ensure that we can use all rates of [0] since
> there is no divider between dclk_vop and hdmiphy. Overall it is pretty much
> the same situation as for RK3328, which handles these clocks in the same
> way (see dclk_lcdc for RK3328).

I came to similar conclusion for v1 of this patch, see [2].

Maybe we should assign clk parent in DT similar to rk3328.dtsi to make
it extra clear that hdmiphy should be used as parent?

  assigned-clocks = <&cru DCLK_VOP>;
  assigned-clock-parents = <&cru SCLK_HDMI_PHY>;

Also for next revert patch you send, please include the patch author in
the recipient list :-)

[2] https://lore.kernel.org/all/d95d317c-5f6e-42bd-94a9-e1a6c7685e2f@kwiboo.se/

Regards,
Jonas

> 
> Regards,
> Alex
> 
> [0] [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c?h=v6.13#n293
>> If the client application does not use GMAC and CPLL is free, make this
>> change on the local branch.
>>
>> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
>> ---
>>   drivers/clk/rockchip/clk-rk3228.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/rockchip/clk-rk3228.c b/drivers/clk/rockchip/clk-rk3228.c
>> index ed602c27b624..9c0284607766 100644
>> --- a/drivers/clk/rockchip/clk-rk3228.c
>> +++ b/drivers/clk/rockchip/clk-rk3228.c
>> @@ -409,7 +409,7 @@ static struct rockchip_clk_branch rk3228_clk_branches[] __initdata = {
>>   			RK2928_CLKSEL_CON(29), 0, 3, DFLAGS),
>>   	DIV(0, "sclk_vop_pre", "sclk_vop_src", 0,
>>   			RK2928_CLKSEL_CON(27), 8, 8, DFLAGS),
>> -	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>> +	MUX(DCLK_VOP, "dclk_vop", mux_dclk_vop_p, 0,
>>   			RK2928_CLKSEL_CON(27), 1, 1, MFLAGS),
>>   
>>   	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
> 
> 


