Return-Path: <linux-clk+bounces-7560-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9058D6138
	for <lists+linux-clk@lfdr.de>; Fri, 31 May 2024 14:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E624F1C2220F
	for <lists+linux-clk@lfdr.de>; Fri, 31 May 2024 12:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED981581F3;
	Fri, 31 May 2024 12:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ry+sBbA2"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1555514B084
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 12:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717157066; cv=none; b=qJtj6ebSfkR6InGcUns3v4v94XKgdPBHyz+ub6G21CnTulZfzM05hp/a6r2gZxwioaYkiRwvYS4gvUuL+cwSogfTTrh1HzcKYIvODjEPQRKH9n9ofAcsfVPxI2pJUxNvTNG3l7GnJAtvxhukW/lM48GDo6dTQqHm5OzJ3KWRfHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717157066; c=relaxed/simple;
	bh=6xdvJeDyYBD4qbZ8lT/zvJ7dO2l6Wggb6jIEtTTboGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWigiUH4blcMJcZ4Ei586XFpJb8pgkUlHv84YLFj/zFJugOJgpE3W3N6MRpvt4K8FJu8Q+XQuG7Z8P8By4bIQAPYjDAWOy8HMHLGX583cu7kjYR0LzBBBAKzXz1pnXhQRpXtPZMaSvCnZ1ybZiSEHw4cRrLtjxIlKISfu76QPjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ry+sBbA2; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52aea6067c8so2338886e87.0
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 05:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717157063; x=1717761863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QppKMPnoJFrrG7X3aJOQRgCs56wwZx8U2VxR/4HfLRc=;
        b=ry+sBbA2d/i3ImCnIsCZlweZQX4NnC/ijEewiklxMH4ZVFxIdYhPto/UKhaf8jHiEf
         8ifUaUoAujYmA0jj3yZhFUubWwRJh9b30rr1dxuiIJSp6tGPfLjSn7Wkkx1ukWSOU+sp
         wKyF+m4sbwmFlWquGfFptsZzOimUm48z7lmBjhacpw+8gphig76P+Q5xrzZichAHDF/t
         78NuwucbRBgHvh1vnwb/gYqUjeklq3JZPgzFIum6RIypS2sWI6WBXGFOTn1cEhYzO+zR
         QwPCHFIxJ5sZjJhbat313CliDVorGPbUPjuN5XfG4xCr7KtMn1a6duSaCJcmTCI53/Jk
         K4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717157063; x=1717761863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QppKMPnoJFrrG7X3aJOQRgCs56wwZx8U2VxR/4HfLRc=;
        b=FBavYxEUlkCWdzhXNH+D6KhtRw+fRdI7ILm1xa645/BFMULZWP2+KOmSa2+c8FPmGr
         PLkH6TZ3qvgDEErN1R/rKiCcU58zW+74gTwcR6R5WL6rC84PZDIPlQNRzJIStkrAaA46
         je4/InezYHKGnqVpIE0sljzW5ZWbTtYBRW4C4cOL7RHyigSZSxl2kq5l7cVW+QztbivM
         7gXjEaqRQTuIcOXps/E9AU5mCLkU9SV8zBfDNSGrwKVum5M24lwVYz+k+7AKfwy1xxk7
         FcRGbUJ9fX2yIbJIYCTJo4z0VhA2K+w2GejXRXkiwGdd12wYbUfCHZPJeuqmT443DFrh
         HWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0I3gHBawfCV4FyhDEaLxfuHRpqr4Tv+WL12rMi04C3ohrQeNobT8IyqD5hjRMQT97nCDrlWnDI2Qasud67hJXTiNsip5OqS39
X-Gm-Message-State: AOJu0YzuzLqJklUCywsiNjO7Ftu0NUcqwG4/Te8hCyKbgTs9/0oZP40x
	REP1Lp63NRYHO7HKYjlAcGcPwu3f0LNPJfL2AISliWvNwf1A1iTKe3Vi/xhFysI=
X-Google-Smtp-Source: AGHT+IHWCNuEqJi9LuYYD8GAiM8tuYHlXxxRcctEj/EVqNcTsAou3H4jkdkLfvlRb36nQ/5Wf94s+A==
X-Received: by 2002:a05:6512:3b25:b0:522:1e16:1f17 with SMTP id 2adb3069b0e04-52b8980b4damr1500989e87.65.1717157063255;
        Fri, 31 May 2024 05:04:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d75dacsm309445e87.132.2024.05.31.05.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 05:04:22 -0700 (PDT)
Date: Fri, 31 May 2024 15:04:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, quic_jkona@quicinc.com, 
	quic_imrashai@quicinc.com, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcm6490-idp: Update protected
 clocks list
Message-ID: <4dvqegoz45ct5rqknf6vgi6rvh4osaecfyp7fcrs26lcsq4npu@dwoyubuqlbss>
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
 <20240531102252.26061-4-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531102252.26061-4-quic_tdas@quicinc.com>

On Fri, May 31, 2024 at 03:52:51PM +0530, Taniya Das wrote:
> Certain clocks are not accessible on QCM6490-IDP board,
> thus mark them as protected. Update the lpassaudio node to
> support the new compatible as the lpassaudio needs to support
> the reset functionality on the QCM6490 board and the rest of
> the Audio functionality would be provided from the LPASS
> firmware.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 28 +++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index a0668f767e4b..4eece564331a 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: BSD-3-Clause
>  /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  /dts-v1/;
> @@ -688,3 +688,29 @@
>  &wifi {
>  	memory-region = <&wlan_fw_mem>;
>  };
> +
> +&gcc {
> +	protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
> +			<GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
> +			<GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
> +			<GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
> +			<GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> +			<GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
> +			<GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
> +			<GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
> +			<GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
> +			<GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
> +			<GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
> +			<GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
> +			<GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
> +			<GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
> +			<GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
> +			<GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> +			<GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
> +			<GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;

Is there any reason why this list is significantly larger than a list
for RB3g2 or FP5?

> +};
> +
> +&lpass_audiocc {
> +	compatible = "qcom,qcm6490-lpassaudiocc";
> +	/delete-property/ power-domains;
> +};

Separate commits, please.

> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

