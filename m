Return-Path: <linux-clk+bounces-5976-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F528A690F
	for <lists+linux-clk@lfdr.de>; Tue, 16 Apr 2024 12:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FC5628342A
	for <lists+linux-clk@lfdr.de>; Tue, 16 Apr 2024 10:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4111292EB;
	Tue, 16 Apr 2024 10:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wclPlGpv"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C171292CC
	for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 10:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713264763; cv=none; b=o1jhOuHkulSArQ0uZ4OnOEEWSybtHTvdHaAiC8kJjzrVMn9a6lKpp+xk9G9+OE6lVfJCxJMGy39YSqz+Kgc0hbIw8cZ7CIF0Sf+fzX58/GqssiMFGSjANN//fltFi2kN6iqP9Fr2LT+0UYGxoaVJz48gJLEyJkxyrewaBdoDC8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713264763; c=relaxed/simple;
	bh=jpcWEFpjeFpqj4mlg7734V1qNoTx1GGeLMyhzIC8jTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lP3qOGdWShfhCAk0iWmiaYftVOMCLonwfzQOcNvPYL80NZR+h0snXpL4o0ZInYI3+wzvI2jjjYdl7kSX+BxlE3ZQJ7wu/W4GqgQMRy1LFH7XVnGHk/vSwlD7zLlDbIpAKrR2s7Ns0Pk1mPZnWvBA3juWi5RFNbdMZUN64ytQYUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wclPlGpv; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5aa3af24775so3055627eaf.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 03:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713264761; x=1713869561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0TxxrwK3iCE49uLbQ7sQ5tDEvF/HbWHLGi4XWFVqlw=;
        b=wclPlGpvY+oztbeNpgoJ4mU+4bHlRx1Jq8mzNA9YLYsoUzGWAAqVEoDYgR0C3ZDV2v
         XvAyuG1yY7sgXsCOtK66cOzKhcGsnk/cgCrOkpDUn0mt3rRFzjTwcyyyOGOzL9fZcPS6
         BVvI5SzwXrNUv7idZgf/bBaCjZOdEiVePaN+L/QH3rYtfLmBiNluht4bI5+ZSX6mU28j
         xx6hCYv+0j6F2RB2sUZrSuzYazBEqFlQUWOobHvqqjCdtnO5ynnCepD1T9pYtyctkpGj
         6NXFp5fruJ0rGK8CVQAFRkl8rHHyEG4YiO3QNdmVp0wp52tlmJrQoo6c0+ZgjA04SvJV
         JcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713264761; x=1713869561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0TxxrwK3iCE49uLbQ7sQ5tDEvF/HbWHLGi4XWFVqlw=;
        b=QkWSwyiENgb15txBnzcxvv5mMhNy2NjfraDY5rw9FiGILOcrta2Jw/rdkjMYTLo4FQ
         xxLX8YAUkEPqEA8TLSK9tCbs429E9uTHAIU7/gT0e+vlifhCMfSLCPt3h23pZqUZiB/z
         UWITArxmRmFVVhat1Qe4Jxv/I2pQvfaDHOQz6hjx7kFBuViHSfO6YlZcHhhHnHssHC3m
         RkWnOJUc4aCdED6ICn4KzpRxiPo66eHtJT+AtmkfSDiCDH3bs5LOXDuUERiaSBhGWOzS
         K/l+nSHvS6NznsGpaULGO7b41YsaajmiQRV1woaWPyJtb3glc2fwH8rnlqP0GzVKoMF6
         yR6A==
X-Forwarded-Encrypted: i=1; AJvYcCVObg2bUXI0DLkdSjhFXGELTQSrRe2DFR9sN7tbQoKUZqWv2/YNyhv3dkQG2mQFLrhQsCSY1ZJauv8U9Px3s4bLG4eU+ihHSc5U
X-Gm-Message-State: AOJu0YwCGPsIGakXyWA3i1JexBsCJJia8aNIBJXqdLJ2LtE2Q8+NzShy
	MOBLE524V6CEo5NeUzWc9M2J6d1IlOf0EoMavk17GznruPEuZkCGwmQo694mAKG6JOm3GKGWVuy
	KeWB2aPU4i3KnGVOnVaZ5ccWJzIngawCpPTwyVw==
X-Google-Smtp-Source: AGHT+IEqEeJmQdQehCPTNQQMD/tcR6Uw0Nol676WtmyqwgXlvaaJnzKAMXtuWis/RQBtHTHTt/sD2iWj7telCINa9U0=
X-Received: by 2002:a4a:aecb:0:b0:5ac:9efc:3b02 with SMTP id
 v11-20020a4aaecb000000b005ac9efc3b02mr5382919oon.8.1713264761347; Tue, 16 Apr
 2024 03:52:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-2-peter.griffin@linaro.org> <d1aaa3a350315b8eb60aaee416fad4382385ca3a.camel@linaro.org>
In-Reply-To: <d1aaa3a350315b8eb60aaee416fad4382385ca3a.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 16 Apr 2024 11:52:30 +0100
Message-ID: <CADrjBPoMWDqUQiW3YUxKxCRJAXzJb=-eL_kfpeMHgaqg8c1HJg@mail.gmail.com>
Subject: Re: [PATCH 01/17] dt-bindings: clock: google,gs101-clock: add HSI2
 clock management unit
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, chanho61.park@samsung.com, ebiggers@kernel.org, 
	linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

Thanks for the review feedback.

On Fri, 5 Apr 2024 at 08:15, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi Pete,
>
> On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> > Add dt schema documentation and clock IDs for the High Speed Interface
> > 2 (HSI2) clock management unit. This CMU feeds high speed interfaces
> > such as PCIe and UFS.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/clock/google,gs101-clock.yaml    | 30 +++++++++++++++++--
> >  1 file changed, 28 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock=
.yaml b/Documentation/devicetree/bindings/clock/google,gs101-
> > clock.yaml
> > index 1d2bcea41c85..a202fd5d1ead 100644
> > --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > @@ -32,14 +32,15 @@ properties:
> >        - google,gs101-cmu-misc
> >        - google,gs101-cmu-peric0
> >        - google,gs101-cmu-peric1
> > +      - google,gs101-cmu-hsi2
>
> Can you keep this alphabetical and add hsi before misc please.

Will fix

> >
> >    clocks:
> >      minItems: 1
> > -    maxItems: 3
> > +    maxItems: 5
> >
> >    clock-names:
> >      minItems: 1
> > -    maxItems: 3
> > +    maxItems: 5
> >
> >    "#clock-cells":
> >      const: 1
> > @@ -112,6 +113,31 @@ allOf:
> >              - const: bus
> >              - const: ip
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - google,gs101-cmu-hsi2
>
> this block should also come before misc please.

Will fix

>
> Once done, feel free to add
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Thanks!

regards,

Pete

