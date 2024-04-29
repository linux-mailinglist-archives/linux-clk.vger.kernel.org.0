Return-Path: <linux-clk+bounces-6476-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ADE8B55E2
	for <lists+linux-clk@lfdr.de>; Mon, 29 Apr 2024 12:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 427BFB22164
	for <lists+linux-clk@lfdr.de>; Mon, 29 Apr 2024 10:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69E63A1D3;
	Mon, 29 Apr 2024 10:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RqN72Smo"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D73D39AF1
	for <linux-clk@vger.kernel.org>; Mon, 29 Apr 2024 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714388146; cv=none; b=uJ8LZIeRVLmijQa5CXGdbUwWxujauPZR7HSFTcGp3P1xiBzBYxkoznl/qVYvuSvuzeZ063SFxlGqq2UKRb/f/6ghErsULY+wpBAvAW6iuFAS5W9MRHpicZmQ3K/LRzdOlVKM9s0b1iW58tNKQ1HFhsJAyJXUdRV0vtjt+1+Qc18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714388146; c=relaxed/simple;
	bh=Xpupn6nv6f2q38+tmYSrohtAxHhfoWPOabgy2X+P2HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcsXotb7FMId26C9GGHFcoq4THb3Zhxyc9nJMwbmZZy8NHEjiymBEDmbw+PW+C38MwewGviiEvam16Na0l5ISo3qVnjnNXcTdWaHcep8hHz93LEX73Ukr9PeMONQq4Pvnze0qnKDZQCj4vEuw9YKN1wLEUpeBEuun/yKOFZUUJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RqN72Smo; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-de56d4bb72bso4970257276.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Apr 2024 03:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714388144; x=1714992944; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HK9OBY6JCsI5PbvjejB+IUXQa8uw72iX0OVXzGaQJV4=;
        b=RqN72Smo87boybYk0biU491UJ2hX+RJHRb0epw9NuEPoXPbZy+O/dcrX2UQzwz8zfn
         22unEBQRlyVVqSgIQ/HEephQ9WNkxmNkLm8v2VzY5JUlHFujea//EyDoUTY6m0hgFpJD
         vSixFTitHZPDDzbd/I3UGA4l0UoHZjBbeZbI0FbsSwFOjZJImU4hDUfDlniXwaeSsrJ1
         NdQQjLtv7e/TT8Norxfk8IVQsMmxpYgXr6BpoPtQQ1Iqb2cQXmjWc98pYN0UPW96r8G6
         8dKBcsZvFHCValowyiSrTJAnLiJnSU138DJr9MctjH2udQl5ua90RDaXiVV6R7kX0Xaw
         IZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388144; x=1714992944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HK9OBY6JCsI5PbvjejB+IUXQa8uw72iX0OVXzGaQJV4=;
        b=oVnT3ZfqJkKXVuH9akqI+t81fJyffsrX91AMi7hSq6dxheLXCAGakK5Efg5Xj0SbER
         34dkHuMgbr9pjsEGJBeVrhvvsOCAZGamCMXzpWtid1tnbmrT1Wu5h8fxHI9UAKjJRfIk
         FNObNZwMB9wRhPzFU5MzEaXK5RUREDyFIKKmPqYrDxPlJWdhgHtEa8oVbbymwFv9DADb
         hv8Kiui36BwcCbhoayYmOHIbBHPVvv5rk22cw+FqsF6yrW3UEVhpO/eMwdrqjPC58NGa
         Uae0Ct/q+quxmjLJwGWI0MqN6kxACA4fZQV50Un58hlJU15qQvnzVN7bYRtLjS4kk0Wx
         NNXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmZJdKJqI4gPmYyATdls1GRiYoEcypkE6Uxpw3JVTE6um3CEDLZqnn9rSh7r0zsvPFevgmoJ/O6wm2PPPXVXhGEQ0AK49N31aW
X-Gm-Message-State: AOJu0YzJnKGHIECrw+1uU9Khu81yIEVRjDtvKcFTt2btD+viSfPdRz9f
	61BgmG4AAvvfguHdLKhCLJM/aaPER1weciuy1CzTrUwDNpClpr7OSBaYzwGL/hi1mofYc7PBR36
	7SZwF35RJNoM8CCRO4PzMLWvvoaBXrbJV9K8oMQ==
X-Google-Smtp-Source: AGHT+IGnLAI/1mmfL0Yrtu3STdW3JZRgrtSe9fLYX4PwRR3wSZS0mEZbbEeASJOYhpilXlNLDeYA2jBBTzekDMQ4uOM=
X-Received: by 2002:a25:ae18:0:b0:de5:5d4b:1632 with SMTP id
 a24-20020a25ae18000000b00de55d4b1632mr9731287ybj.60.1714388144152; Mon, 29
 Apr 2024 03:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415182052.374494-1-mr.nuke.me@gmail.com> <20240415182052.374494-7-mr.nuke.me@gmail.com>
 <CAA8EJpqY1aDZMaeqBULEOD26UeGYbLd8RsA16jZw7zXJ7_oGPQ@mail.gmail.com>
 <6726fa2b-f5fe-10fb-6aab-f76d61f0b3cd@gmail.com> <4a7b1e1d-ac68-4857-8925-f90c9e123fd1@gmail.com>
 <CAA8EJppGW=qyk2P6Z_S=dp0njsCjqZaXjw8qU4MY1HOZR-N=4A@mail.gmail.com> <Zi88Hdx6UgBo/gti@hu-varada-blr.qualcomm.com>
In-Reply-To: <Zi88Hdx6UgBo/gti@hu-varada-blr.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Apr 2024 13:55:32 +0300
Message-ID: <CAA8EJpq+Bbws8yH5Xq7rHyA+-=DaCcfEcgUa5RUt2+LWQW0kKg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] phy: qcom-qmp-pcie: add support for ipq9574 gen3x2 PHY
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: "Alex G." <mr.nuke.me@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Apr 2024 at 09:20, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> On Wed, Apr 17, 2024 at 12:50:49AM +0300, Dmitry Baryshkov wrote:
> > On Wed, 17 Apr 2024 at 00:25, Alex G. <mr.nuke.me@gmail.com> wrote:
> > >
> > > Hi Dmitry,
> > >
> > > On 4/15/24 16:25, mr.nuke.me@gmail.com wrote:
> > > >
> > > >
> > > > On 4/15/24 15:10, Dmitry Baryshkov wrote:
> > > >> On Mon, 15 Apr 2024 at 21:23, Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > > >> wrote:
> > > >>>
> > > >>> Add support for the gen3x2 PCIe PHY on IPQ9574, ported form downstream
> > > >>> 5.4 kernel. Only the serdes and pcs_misc tables are new, the others
> > > >>> being reused from IPQ8074 and IPQ6018 PHYs.
> > > >>>
> > > >>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > > >>> ---
> > > >>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 136 +++++++++++++++++-
> > > >>>   .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h   |  14 ++
> > > >>>   2 files changed, 149 insertions(+), 1 deletion(-)
> > > >>>
> > > >>
> > > >> [skipped]
> > > >>
> > > >>> @@ -2448,7 +2542,7 @@ static inline void qphy_clrbits(void __iomem
> > > >>> *base, u32 offset, u32 val)
> > > >>>
> > > >>>   /* list of clocks required by phy */
> > > >>>   static const char * const qmp_pciephy_clk_l[] = {
> > > >>> -       "aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
> > > >>> +       "aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
> > > >>> "anoc", "snoc"
> > > >>
> > > >> Are the NoC clocks really necessary to drive the PHY? I think they are
> > > >> usually connected to the controllers, not the PHYs.
> > > >
> > > > The system will hang if these clocks are not enabled. They are also
> > > > attached to the PHY in the QCA 5.4 downstream kernel.
> >
> > Interesting.
> > I see that Varadarajan is converting these clocks into interconnects.
> > Maybe it's better to wait for those patches to land and use
> > interconnects instead. I think it would better suit the
> > infrastructure.
> >
> > Varadarajan, could you please comment, are these interconnects
> > connected to the PHY too or just to the PCIe controller?
>
> Sorry for the late response. Missed this e-mail.
>
> These 2 clks are related to AXI port clk on Aggnoc/SNOC, not
> directly connected to PCIE wrapper, but it should be enabled to
> generate pcie traffic.

So, are they required for the PHY or are they required for the PCIe
controller only?

>
> Thanks
> Varada
>
> > > They are named "anoc_lane", and "snoc_lane" in the downstream kernel.
> > > Would you like me to use these names instead?
> >
> > I'm fine either way.
> >



-- 
With best wishes
Dmitry

