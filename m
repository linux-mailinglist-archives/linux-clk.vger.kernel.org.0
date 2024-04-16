Return-Path: <linux-clk+bounces-5981-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5926E8A69E0
	for <lists+linux-clk@lfdr.de>; Tue, 16 Apr 2024 13:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED6901F219B0
	for <lists+linux-clk@lfdr.de>; Tue, 16 Apr 2024 11:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF28129A9E;
	Tue, 16 Apr 2024 11:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="byrwXn2o"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1582129A71
	for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713267933; cv=none; b=QQCktGmx87ppI5HHVdGWCTetD8GwbNHfqK/TOwqU9psKuilVhV29X1OqH0qZYjMK3+5YAVxbG91KjHqzq3++P8txX0WD1fOvHISmc7zwqx1m0NGWD1bdY4Tv1Ey1b1rusJ3ZT23iW2h4wBsq+/RYN3/oE1Dl0+6PRqnK2b0bMtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713267933; c=relaxed/simple;
	bh=dDlCzkzdCcNFshIRjsJjUBzP1X/mdztmU1oPjV+q8lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZL6QzC+V56pWRY2Ry+G4i0lF9eO8B7xgb/9w9GtxDCcokwGej4bfLwFZGqrkefKi3eQ0RPZg6P2bjpk1kRKoOSO/02o1vkM5tJm5LsDgAdCP2cWvp5+zCpdkCk4ayzAyFFC9SC6yCG2aUjZJMoPO7QjhPvYxY4Wr46J/dyvzt/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=byrwXn2o; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5aa241232faso3879021eaf.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 04:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713267931; x=1713872731; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aNdL72WRHKwu0pt/55XuOUw+WlB5anBc9z5sZqU2AYA=;
        b=byrwXn2oXs74FHgM2rHpYTv4oeFBIOevnHUUQqk0ayo23lOIwgo6cu/G3doJxDBsfG
         expba0IkmquRo8nhwJji2vFHQTTBmQyzfyz/dvwz3bbPDXMS9PzCihbey6q/7vhgnLvK
         /3RFl+oc6cE75QNSJ1PF7dvzYfsSqulDEHFgDpBNVthmWZm1ma/QNrLsEPhkbtgABhpP
         0c6eINkHQc1UJDreXMQPlJ21yElaGuzg7cJ41hX2jCErnAf/7UrhhjHscaKFDY+uh8ve
         GLkodtlJzvrIrKqHrXbIKBKYXw35WaJcVcAzaAMoaGmw37f6Mfn4t7ZGP4JZihVU3hGO
         WB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713267931; x=1713872731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNdL72WRHKwu0pt/55XuOUw+WlB5anBc9z5sZqU2AYA=;
        b=e+CyifyjykykriRsbR1b88v7d6qIEy0J4su8QzouFok6Jap0kEgzA0uM4tKqcla3VG
         iL/N5xbCc9MxTEPCPqFnSXbVCTyCl1aiXAN7NOUAaOr3PYr0ArRfLvmSn3rMO86BLReZ
         xK2sX6lO1hNBTV+xa+254DGCHE7Mf6R4GuNfLASF1JGXMHIICEobItzjKDPRVFZsA33A
         qnKCqanmuyASIJZYKFzwxNDIMjw//cwVUA9u5TzTNVzpE+qXMSkz8jim34hu3k5dMFrQ
         KHvMsYwhw2BxsicAPWLJ6Smk09OzODe3+lDSk+26tnpUvmDoGq2refi0iVYVWy+BduHV
         GRuw==
X-Forwarded-Encrypted: i=1; AJvYcCV7I9uOAVUn8nd+nqvQET6IpRU7LIvMsBCHO7/J6wW4mtDnl4Zax7xHJonlmdfzuMf2916IV9s6UYwP/Yd6pJ0RZM9Bc74vmPWm
X-Gm-Message-State: AOJu0YxzzLw8DVz4Jcy4ctiDpf/mxZdsA4vXK/hGzm4u5MV97VG+Upxw
	i4Zh3B0c6Dgb0aSTVjRxY5YpTE+9y0b9odJ8rrgNu5HrkFomiEAhHWkJKmF4NUIBDxxMzJDtlq/
	zKPHF5B+n5GHxQYG4bTMG/Fck+ARljXBkbjEXWg==
X-Google-Smtp-Source: AGHT+IHxJp/JnOY3GdAw5XogqzJkAdg7j5verXH36RVlSMIf75LFqNIKEqK/67ccEbRIuuWgR4HOxuNMXRZG6yHWE5I=
X-Received: by 2002:a4a:8c0e:0:b0:5ac:9f22:2686 with SMTP id
 u14-20020a4a8c0e000000b005ac9f222686mr5969583ooj.5.1713267931027; Tue, 16 Apr
 2024 04:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-5-peter.griffin@linaro.org> <ce8275b0-efa8-47fe-a4a8-471fac9afa10@kernel.org>
In-Reply-To: <ce8275b0-efa8-47fe-a4a8-471fac9afa10@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 16 Apr 2024 12:45:18 +0100
Message-ID: <CADrjBPp2Y0tgXr+8DcgKOND2dLjUsNu-J7ob8tz=SeB4VeZ04w@mail.gmail.com>
Subject: Re: [PATCH 04/17] dt-bindings: phy: samsung,ufs-phy: Add dedicated
 gs101-ufs-phy compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, chanho61.park@samsung.com, ebiggers@kernel.org, 
	linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, 5 Apr 2024 at 08:50, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 04/04/2024 14:25, Peter Griffin wrote:
> > Update dt schema to include the gs101 ufs phy compatible.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml | 1 +
> >  1 file changed, 1 insertion(+)
>
> This should go via phy tree. DTS should not depend on other subsystems.
>
> If, after resending as separate series, phy does not take patches for
> longer time, feel free to ping me, but first let's try to go via phy/UFS.
>
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks for the review. fyi Vinod has now queued this and the other ufs
phy patches :)

regards,

Peter

