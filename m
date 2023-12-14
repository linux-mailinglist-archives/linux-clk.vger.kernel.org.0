Return-Path: <linux-clk+bounces-1377-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 436118128FC
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 08:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D67C5281B31
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 07:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAA5CA5F;
	Thu, 14 Dec 2023 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RwXTj6pm"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60AE7114
	for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 23:21:00 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3b9e6262fccso4880820b6e.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 23:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702538459; x=1703143259; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E+lTsJeZ0gUOBqbzzRtKzTHzKA4q+fi1iIj8a7QvU6U=;
        b=RwXTj6pmjGextkpoVS6AXgQDRY4rdKbwAtPqHDsE9/oDp+3Hb+YmZp9xIEUX3wOkxY
         gI9P+A/VoYBB4Dc4SKODdfFyFisHAexXLH0KTGPuKXEzrt1iWDKGWOrzkq0HtCF9PIeA
         DO9tQLc8Ne6r2+k9nOodKuR69AHtwj4xOKpTse70dfxomnMc1/rAoyGJ/4wZmeBqQI+j
         Ds39cfZbmeKSqWbL75IG7hIdQkGd5JXrWXIN1ROC8W32EqGfeE1rf28LGkNgvYpX7mL2
         NNkhZhKCN2nd3e1yjMyGaXjw8OwFKVJHKUdf3lA54y8cLWNFov0bQR6AyS7RdyEiueLH
         59qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702538459; x=1703143259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+lTsJeZ0gUOBqbzzRtKzTHzKA4q+fi1iIj8a7QvU6U=;
        b=jGCNG5X9N/AmcoVQMDvbO/Xd12XSd+JmhDsmRShnh1muWk/isc0vkjOGZbFNEnos8z
         9zwMtZpO+e7WCOi9mBHcMDGzYzJ962TS8TEWafjZNqlLewS9WOHEhSEzjxj66aD0/Qma
         OkAXRK0xHiMoG/VUo/DpzQEScHQK6KQMIZo4oApeh5ncM9C9KgGvS9LWAjWx/YsKm5wW
         AGVJaGStC669iqlveOwXMeOmk5PzNYl4TcUWeIP6QIEzxPmIIFfJvPLPNYgrYkYcNnl/
         +dJeSWCXrOUysoq2ZjBdDaA5KND1/qdUzA8NOI+zyPZQ6v1xpkGdZ3Fz7kFAXICmev/7
         wJTQ==
X-Gm-Message-State: AOJu0YwxIj31SH4norj9p11Idb6T8kWnVmEjf5il+2QKX870OeYJ7f34
	vCR9ey0JZeR2f5J5kTH74kBrSCl8jJI5waEms7GWmw==
X-Google-Smtp-Source: AGHT+IG+rJCUqFxD37rX/E7u2uLcsa0i45ReRUeOSB/aPceCAS76sfm4WJSdI1aYG+X+Hv7jFYOqLLCYgOhAJjE+HqI=
X-Received: by 2002:a05:6808:320a:b0:3ba:1e0:f1df with SMTP id
 cb10-20020a056808320a00b003ba01e0f1dfmr11721187oib.70.1702538459745; Wed, 13
 Dec 2023 23:20:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214062847.2215542-1-quic_ipkumar@quicinc.com> <20231214062847.2215542-9-quic_ipkumar@quicinc.com>
In-Reply-To: <20231214062847.2215542-9-quic_ipkumar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 09:20:49 +0200
Message-ID: <CAA8EJprxUxK5tkWPShuJu8nqz_frDC_5p-b4x7KRZsOxJ=EsjA@mail.gmail.com>
Subject: Re: [PATCH 08/10] pci: qcom: Add support for IPQ5332
To: Praveenkumar I <quic_ipkumar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, bhelgaas@google.com, 
	lpieralisi@kernel.org, kw@linux.com, vkoul@kernel.org, kishon@kernel.org, 
	mani@kernel.org, quic_nsekar@quicinc.com, quic_srichara@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	quic_varada@quicinc.com, quic_devipriy@quicinc.com, quic_kathirav@quicinc.com, 
	quic_anusha@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Dec 2023 at 08:30, Praveenkumar I <quic_ipkumar@quicinc.com> wrote:
>
> The Qualcomm IPQ5332 PCIe controller instances are based on
> SNPS core 5.90a with Gen3 Single-lane and Dual-lane support.
> The Qualcomm IP rev is 1.27.0 and hence using the 1_27_0 ops.
>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
> This patch depends on the below series which adds PCIe support in
> Qualcomm IPQ9574
> https://lore.kernel.org/all/20230519090219.15925-1-quic_devipriy@quicinc.com/

The series did not receive updates since the end of May. Should we
expect the next iteration of that series? Otherwise depending on it
sounds like a dead end.

>
>  drivers/pci/controller/dwc/pcie-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 109df587234e..3d54de1a71df 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1642,6 +1642,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>         { .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
>         { .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
>         { .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },
> +       { .compatible = "qcom,pcie-ipq5332", .data = &cfg_1_27_0 },
>         { .compatible = "qcom,pcie-ipq6018", .data = &cfg_2_9_0 },
>         { .compatible = "qcom,pcie-ipq8064", .data = &cfg_2_1_0 },
>         { .compatible = "qcom,pcie-ipq8064-v2", .data = &cfg_2_1_0 },
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

