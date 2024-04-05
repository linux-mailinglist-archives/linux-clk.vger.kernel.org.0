Return-Path: <linux-clk+bounces-5552-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E948996CD
	for <lists+linux-clk@lfdr.de>; Fri,  5 Apr 2024 09:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F16882854EC
	for <lists+linux-clk@lfdr.de>; Fri,  5 Apr 2024 07:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878F413D62B;
	Fri,  5 Apr 2024 07:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c84w0mMz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0972A13D620
	for <linux-clk@vger.kernel.org>; Fri,  5 Apr 2024 07:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712303078; cv=none; b=RZkRftk6SLqTGsrpgozEEHkqNrSVZvr4eNmO2Q6G2X+RrkifdvhY1+T8jpIhLCq6VamKY75cf9P0xMvPQurheCnNoKbHgyMJaM6Qm2xhc2LrMkiO1SqEH9BHvcqjRa4QXHowAV1GiSYBAqKMUpk9YoLYjtGgk+pv38BxFffdYb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712303078; c=relaxed/simple;
	bh=bxMd5VtoFtZ5IA+lfWe6irnCCj68qYa5NaOxVXPK+Zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxqMBKOANe4qygunQQsS9OAhrTse2tb0R7t3e6+Ip+gs7veXfr+9XvuP78rWd1P12n0SOrexRp49KCxtu1v2G90cSs5sqS4UVSsapbY87zQDg5U74ZCCZrwsVM1FtDDKAeUOiwJx1YYw8F8+SDFTyeITWWD6tv3J/yZ3SdRDLg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c84w0mMz; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6152ad16cd6so22055127b3.2
        for <linux-clk@vger.kernel.org>; Fri, 05 Apr 2024 00:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712303075; x=1712907875; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zYQYHc96aAqkJY4oGXNQ40gKh1E9/vfyHDywYKQqVgk=;
        b=c84w0mMzteKparFyfWw+KzRpMnkX2NbKQICh758hUtWdlVr1o5Js8TXjfy+lwLBjux
         X+p+a2ddT36Cwt07YJUmepMSAbjJyDzgkfuf8LaosV2ktpDU4dbV5a5XX098dR+OAVVJ
         MKCnODMoZBOHELCnHl6acIc+X097JlZmhPByWfXyVTQ1ZrEoOivMEvbUje204gGc0xDr
         HtK1kTzCGI8R4VW2ynBUtqTeH0AlQ/aSZcM0G6Chta0I9hoJjvqg7YzgnwEij6KuRTCf
         btiZrKx7kPDoAskNk87fFq0CkfRoLMT1cBcLjOU53/I4dBSz/16amjzSMI5mMJbN/wdt
         7YFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712303075; x=1712907875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYQYHc96aAqkJY4oGXNQ40gKh1E9/vfyHDywYKQqVgk=;
        b=cv+50G0F1J8yKEB6iHZC5wSuwbOPJaEQYIv9CCBhcU0xdIFwnG1f/xNHrMIqjqkAI0
         8eQy4xUaTIexl5SHhw++PsgOd+rJ8GMa5hFnlaDhnR3HvEzjCQVG1uq2xLEbWBRB5mEK
         xgSspe/Rh7t29Ty4DWcuhaeuyj5vbXb0ywwKgmf5EXe4XRHgp5fbi44LHwv28Qvx4j3I
         qOX9AO7CuyTYVXHMwoeWoawV8FP1wsYorwesbiKEMjxGNXfNjZRWqwt2qGDdjR1r08O/
         lyAujwGQl5OwHEPGcuFMyMT8Z7zGcfF2M+ARDkvzu4fLkweXD6k+klbbZKhBLaz+U8Wr
         AW8A==
X-Forwarded-Encrypted: i=1; AJvYcCUyPdQzQAHvpqCqHylgrxP1pa5BQd+xx1qJOfUqf8R0zeMb4yesfaKEFF7RuZYssVVEtG/0lpQ4V88n4DIUwZkIqorcw5j9CbNo
X-Gm-Message-State: AOJu0YxDivIm9D76a3t/am5kqnFkIn7MGiXF3SJiyVwXMWexvMR5MfwU
	7MY2ZHhN+t6g70Gg9WXa15PqDZd77/buCoebiBfpHeAgW6g+H/nxILqOKuhFgg2lKNDFO/lIVtm
	sRiDoIRZBP3IzFqX7gu8Gb9Kj0dM8twG8UjdN5A==
X-Google-Smtp-Source: AGHT+IEu6kTYj/i3eHlvNZAWtBlfhRcBURjNaSYT7hSkM1HYOoTHlVFCzx0BUjloetjyotgljRz9/W3Z2OBtLyxBdoM=
X-Received: by 2002:a25:800c:0:b0:dc7:4367:2527 with SMTP id
 m12-20020a25800c000000b00dc743672527mr599078ybk.49.1712303075009; Fri, 05 Apr
 2024 00:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321092529.13362-1-quic_jkona@quicinc.com>
 <20240321092529.13362-7-quic_jkona@quicinc.com> <CAA8EJppHGS+W-aiXvJ2cE=jCbua8Y0Q+zv_QTs+C9V5+Y1vuZg@mail.gmail.com>
 <008d574f-9c9e-48c6-b64e-89fb469cbde4@quicinc.com> <b3464321-0c52-4c41-9198-e9e7b16aa419@quicinc.com>
 <CAA8EJpqDwCVAjDphnC-HdfseMJ-xd8VVxb5+9UcGEcKLcn-heg@mail.gmail.com>
 <fba2474e-31a6-4fef-acf9-7069933584c8@quicinc.com> <CAA8EJprfaALkQe-wUrBow6B1A66ro0AoVpfnQJLXgqFmL8isNQ@mail.gmail.com>
 <8a5a3cf8-5b4f-487f-ad91-00499509f8ec@quicinc.com> <CAA8EJpoW8MQQ3OPfOVYRJtgsn1JgKd5Ew7vqgWx3xWE-xJ=R-g@mail.gmail.com>
 <03f8d2ee-2467-48aa-9b76-06eb13202b8c@quicinc.com>
In-Reply-To: <03f8d2ee-2467-48aa-9b76-06eb13202b8c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 10:44:23 +0300
Message-ID: <CAA8EJpqL_bkyoUKkY_nr7PvbvC-1dVKr9kNQKsAU-2PPO9717g@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND 6/6] arm64: dts: qcom: sm8650: Add video and
 camera clock controllers
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2024 at 09:01, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
>
>
> On 4/4/2024 9:35 PM, Dmitry Baryshkov wrote:
> > On Thu, 4 Apr 2024 at 13:06, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 4/4/2024 11:00 AM, Dmitry Baryshkov wrote:
> >>> On Thu, 4 Apr 2024 at 08:13, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 4/3/2024 9:24 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, 3 Apr 2024 at 10:16, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 3/25/2024 11:38 AM, Jagadeesh Kona wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 3/21/2024 6:43 PM, Dmitry Baryshkov wrote:
> >>>>>>>> On Thu, 21 Mar 2024 at 11:27, Jagadeesh Kona <quic_jkona@quicinc.com>
> >>>>>>>> wrote:
> >>>>>>>>>
> >>>>>>>>> Add device nodes for video and camera clock controllers on Qualcomm
> >>>>>>>>> SM8650 platform.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> >>>>>>>>> ---
> >>>>>>>>>      arch/arm64/boot/dts/qcom/sm8650.dtsi | 28 ++++++++++++++++++++++++++++
> >>>>>>>>>      1 file changed, 28 insertions(+)
> >>>>>>>>>
> >>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >>>>>>>>> b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >>>>>>>>> index 32c0a7b9aded..d862aa6be824 100644
> >>>>>>>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >>>>>>>>> @@ -4,6 +4,8 @@
> >>>>>>>>>       */
> >>>>>>>>>
> >>>>>>>>>      #include <dt-bindings/clock/qcom,rpmh.h>
> >>>>>>>>> +#include <dt-bindings/clock/qcom,sm8450-videocc.h>
> >>>>>>>>> +#include <dt-bindings/clock/qcom,sm8650-camcc.h>
> >>>>>>>>>      #include <dt-bindings/clock/qcom,sm8650-dispcc.h>
> >>>>>>>>>      #include <dt-bindings/clock/qcom,sm8650-gcc.h>
> >>>>>>>>>      #include <dt-bindings/clock/qcom,sm8650-gpucc.h>
> >>>>>>>>> @@ -3110,6 +3112,32 @@ opp-202000000 {
> >>>>>>>>>                             };
> >>>>>>>>>                     };
> >>>>>>>>>
> >>>>>>>>> +               videocc: clock-controller@aaf0000 {
> >>>>>>>>> +                       compatible = "qcom,sm8650-videocc";
> >>>>>>>>> +                       reg = <0 0x0aaf0000 0 0x10000>;
> >>>>>>>>> +                       clocks = <&bi_tcxo_div2>,
> >>>>>>>>> +                                <&gcc GCC_VIDEO_AHB_CLK>;
> >>>>>>>>> +                       power-domains = <&rpmhpd RPMHPD_MMCX>;
> >>>>>>>>> +                       required-opps = <&rpmhpd_opp_low_svs>;
> >>>>>>>>
> >>>>>>>> The required-opps should no longer be necessary.
> >>>>>>>>
> >>>>>>>
> >>>>>>> Sure, will check and remove this if not required.
> >>>>>>
> >>>>>>
> >>>>>> I checked further on this and without required-opps, if there is no vote
> >>>>>> on the power-domain & its peer from any other consumers, when runtime
> >>>>>> get is called on device, it enables the power domain just at the minimum
> >>>>>> non-zero level. But in some cases, the minimum non-zero level of
> >>>>>> power-domain could be just retention and is not sufficient for clock
> >>>>>> controller to operate, hence required-opps property is needed to specify
> >>>>>> the minimum level required on power-domain for this clock controller.
> >>>>>
> >>>>> In which cases? If it ends up with the retention vote, it is a bug
> >>>>> which must be fixed.
> >>>>>
> >>>>
> >>>> The minimum non-zero level(configured from bootloaders) of MMCX is
> >>>> retention on few chipsets but it can vary across the chipsets. Hence to
> >>>> be on safer side from our end, it is good to have required-opps in DT to
> >>>> specify the minimum level required for this clock controller.
> >>>
> >>> We are discussing sm8650, not some abstract chipset. Does it list
> >>> retention or low_svs as a minimal level for MMCX?
> >>>
> >>
> >> Actually, the minimum level for MMCX is external to the clock
> >> controllers.
> >
> > Yes, it comes from cmd-db
> >
> >>   But the clock controller requires MMCX to be atleast at
> >> lowsvs for it to be functional.
> >
> > Correct
> >
> >> Hence we need to keep required-opps to
> >> ensure the same without relying on the actual minimum level for MMCX.
> >
> > And this is not correct. There is no need for the DT to be redundant.
> > I plan to send patches removing the existing required-opps when they
> > are not required.
> >
> I agree this is not required if cmd-db minimum level is already at
> lowsvs. But since MMCX running at lowsvs is a mandatory requirement for
> clock controller to operate, I believe it is good to have required-opps
> to ensure we meet this requirement in all cases, rather than relying on
> the cmd-db minimum level which we have no control over.

IIf we follow this logic, we should throw cmd-db away and hardcode all
those values in the RPMh drivers.

We have cmd-db. If it is correct, there is no need to duplicate it. If
it is incorrect, it is a bug that should be fixed or worked around.

>
> Thanks,
> Jagadeesh
>


-- 
With best wishes
Dmitry

