Return-Path: <linux-clk+bounces-11982-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FF6977FE2
	for <lists+linux-clk@lfdr.de>; Fri, 13 Sep 2024 14:31:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 206B61C21773
	for <lists+linux-clk@lfdr.de>; Fri, 13 Sep 2024 12:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FF21D935C;
	Fri, 13 Sep 2024 12:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TfF+Julk"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC861D86E3
	for <linux-clk@vger.kernel.org>; Fri, 13 Sep 2024 12:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230666; cv=none; b=mT+nr8aeVGLEvinNosEX18YaZ3AXFWoX5E+tluA2PX0ALRc1xWnoDnImdRo+NrocoDAbGvyll1BWmJtYoqys9JBEU5iMXenZmse5XZ4694vcaIyvn2fxedlWVh6OqWNPAN0pRPGdaRXgrhFyWFfkcfcPl6pHk34Ls+aZY8RpLig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230666; c=relaxed/simple;
	bh=UJOwm4FyG3ZNvKxMURItPhiS0ItFx/dXt5nE6xyFh3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkUnANkqm9t/8wURA2biw2v1o++1ojX5bgSXXEGDULfe9aaMZXRv/Oj88Kg6G1kaKq+HyXqS8mKxnQb4Z1JGg7rzS0zSimHIJbYC8/6XdJz0JFX+pgteiH6OZV3yIXZSt9kiWbTwM4Np67+UdUS+W6gFNnJTMpxPMP/YzXtv3Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TfF+Julk; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f75c205e4aso24868011fa.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Sep 2024 05:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726230663; x=1726835463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7lfIoqIzq7Oaxzbrg6+hyftX0grPutbfuzbJgM78HVI=;
        b=TfF+Julk6qxsoa3E1wqJPvs36aDWYWXNVf17IapDqDSFBWhq78TMh1mbNr9UEYccP3
         CZfPy31X3ZydlGyQ33madH4KvV8zaZ1+exPpjBHotMEcIdmkOZdmxNLD1l4JN2Mxagv/
         5upIU3OPfZQSMx0kd602s5AGt/G8OSbXrcWSa8JxbxzOGtQ4FpPSIplO095Lk7CAuHnE
         jCj3AIVfQqIeooybTQvKpC4dy+j+cXnnZ0HCz/iaLCcVFn4MN8qltIC48eRnI0VWwCw8
         S4MB4IpGjI3JDBB+V5MuIdwlITPmrdNHiKvtJ63fpUPbCOg0pIXYkcB8PUSnnU/2jr0w
         twCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726230663; x=1726835463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lfIoqIzq7Oaxzbrg6+hyftX0grPutbfuzbJgM78HVI=;
        b=hizJOIuC5I5UIOk+SMCHInIHJjO7fmwwnmrHhBY84ZjDZ4qIQbPIKWixXCKStPL1xi
         aYOLkXSdZbHmen46zmxlh5zoC3lJnsqjyrCHOKwMR6TxsDxLOrbO91I7xkZUhvCc7uAo
         S+mCF5E5GUoCRQBYfSwDtutqLq9dU1YDaI2HGx2EZOdlQf9fIyK/XUgT6h2bcG6DcM+A
         HhlAKbYn7kTeCCIc+6i0wWqT5wU9WFcfO39ISjj779J3o6HhunV/5HKRzQQYbKX/mla4
         C9y5ZAohBe0UhtJI2o6StE13nsVyVAjIu96xR+f4AmxsOMtmHQfJQXNVpiwARA6BWTIh
         k7pw==
X-Forwarded-Encrypted: i=1; AJvYcCVtVyBHIjrlmO2qLzsT1zwcN1G7On3E4wGiOh7RuGSnPkt74D+EaWpfHiLPB2E9K9DASk30pq1A818=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAna5OA4OtBcyZFE53phUhobksrofv5+5EaExJiwx3wjXhZTCT
	YqRI5df+5dUpvbsMucgoNQkjOjhtWgP1hP6Cq7lCfOVEex8oSYl4NrHDbNchjs4=
X-Google-Smtp-Source: AGHT+IEiDkYAB870ZBn/zctGJmdUhoUk4th5m2Zqgejglsbq0AUhxf7YU//dFZlelqKAMfIRGO7czQ==
X-Received: by 2002:a2e:619:0:b0:2f6:1da6:1c64 with SMTP id 38308e7fff4ca-2f787f437fdmr24587471fa.45.1726230661896;
        Fri, 13 Sep 2024 05:31:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c07c83dsm22040201fa.80.2024.09.13.05.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 05:31:01 -0700 (PDT)
Date: Fri, 13 Sep 2024 15:30:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, abel.vesa@linaro.org, 
	quic_msarkar@quicinc.com, quic_devipriy@quicinc.com, kw@linux.com, lpieralisi@kernel.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: PCI: qcom: Add OPP table for X1E80100
Message-ID: <tf4z475uqjenohdgqj4ltoty3j3gopxnbdhrrn6zo3ug5yuvyq@us2nysv2ggxh>
References: <20240913083724.1217691-1-quic_qianyu@quicinc.com>
 <20240913083724.1217691-3-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913083724.1217691-3-quic_qianyu@quicinc.com>

On Fri, Sep 13, 2024 at 01:37:21AM GMT, Qiang Yu wrote:
> Add OPP table so that PCIe is able to adjust power domain performance
> state and ICC peak bw according to PCIe gen speed and link width.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
> index a9db0a231563..e2d6719ca54d 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml
> @@ -70,6 +70,10 @@ properties:
>        - const: pci # PCIe core reset
>        - const: link_down # PCIe link down reset
>  
> +  operating-points-v2: true
> +  opp-table:
> +    type: object

I think these properties are generic enough and we might want to have
them for most if not all platforms. Maybe we should move them to
qcom,pcie-common.yaml?

Krzysztof, Mani, WDYT?

> +
>  allOf:
>    - $ref: qcom,pcie-common.yaml#
>  
> -- 
> 2.34.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

