Return-Path: <linux-clk+bounces-7591-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 096F08D6577
	for <lists+linux-clk@lfdr.de>; Fri, 31 May 2024 17:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CC0C1C21ADA
	for <lists+linux-clk@lfdr.de>; Fri, 31 May 2024 15:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82131770EA;
	Fri, 31 May 2024 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EXb9hhmW"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDC5762EB
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 15:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717168502; cv=none; b=kdDNiHZhknJxEflnaIPe4xRF7uZgqVWF/4YQsbAfEJhhg0HRypp3FPfKpywZuwl8nxMq8rdK6BGdlpERupIqkhy2DLHQT3VGHbLWR2uhoBo63fAtXH4CwzJ4tyO3hzCH/NZRkUnEIO2XTZo4mLJHK27hbku6XgGMQhc6feWhppo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717168502; c=relaxed/simple;
	bh=6AWdQDWgGJAq7nQG8SBrgo8ckqxBhzid+AdmIGtHuRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJN8JWOjer6tqNHrtKBfTL8lAuVuBq/AA+tagZm4mHJHOzuakDLVFXE4Qqk1E1m6AhHsiSj8siFYBj4SSqqNcceaiCz7nFBuK10DKX5TOchAsC5taGJhmESHvuzC3sunv6pFXsgL93WoNVL9KvvbLPvz8GoK8KaMFu68imRi0RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EXb9hhmW; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b8d483a08so414497e87.1
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717168499; x=1717773299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYZlx/SHZV2mJQqNcs4xl6IWMBcVCucCDsZplS2erlM=;
        b=EXb9hhmWLiGJLp3skyXGhVYbUHyhoAQn9Ni162xNDd40WZd2jU0lLjCKnnqyFTrjIC
         23fzJAWFtxb+4LIKz4WcFwju72Hl5k+qYjHVE0p+uUbkpGImfK5tzGmStKUIA8gtRW1O
         u74msF8YHz70Eso+3WWOmwmPYbBT2So4WCEuHK5jXY9lFjZvUiwtRcTmPDZzlpKgU870
         DfgF+3XtvYuHp9ukjsYtv7DMHW6ROkxFvLLoKjuPkR6+vyALV0IDYCP8pYTlS67v2UGR
         jk+GAtS3hHIMRjXBh8/Nx9OwYEZWh+5n9EYw7xt3Skjh/a0qkf+fFcOYX6i/dE6dVii6
         1Zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717168499; x=1717773299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYZlx/SHZV2mJQqNcs4xl6IWMBcVCucCDsZplS2erlM=;
        b=nAuHJ1XeRcARzMdTcQSg7e0XV/+gWfphBy3hWB1CCy9hULUdnmA/cmj4WjwtiNk+cB
         kFJQYNxFkFrGHVldge2ObApWVGrHx0+iFSWpW5/70bO0qR1DMBlZGrIPG2VwgiySF/Bd
         MVIo+mfhNG0DMi9O8IzQY9a17E/SUzoaVy5bDXlpc1JUsqjFZSm/zZlOOEZ9fl2A/sD5
         027ehwgW7bZx4yuG1MzDHPw/doi5whpzc3/rL4kTezmI3Vm/aX+6UNZI6q0QoHjiCUzr
         n8uuHPExJ3KoR/7gaCpzLKIwnyNifIqB9uHlTg8VMlYmdo3dcM+YnSrHS2c5PGAC611f
         DX+g==
X-Forwarded-Encrypted: i=1; AJvYcCXWfODv8gFJNVq1qiuRmytLn5sxaDVEwCsZvi9cKMOJzoMnSXau4pst/1RIAQJWs565wohAcqL8zDjlCbQHy1xyP900O5Ii9pjd
X-Gm-Message-State: AOJu0Yy3TR9N0VyikfpGoxEctEC7JqgbsyUA5x3u3Ki0Kyq9/wKg+7C1
	FOU3ggznIqqyTpH3ccVJ+FHpgfWdYwrjLo08HezCJSa8fUNB9SwozcQYxVNWIRo=
X-Google-Smtp-Source: AGHT+IF3amjM7QbVKYZ487znDKdasgDtKWEpQZIm7AlZ0+nSfEili6eJCyHnqfDTJiqUUlkLLYvqFw==
X-Received: by 2002:ac2:4568:0:b0:525:502a:acc6 with SMTP id 2adb3069b0e04-52b896bfa82mr1410726e87.52.1717168498685;
        Fri, 31 May 2024 08:14:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d7efa3sm357687e87.199.2024.05.31.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 08:14:58 -0700 (PDT)
Date: Fri, 31 May 2024 18:14:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Jonathan Marek <jonathan@marek.ca>, Del Regno <angelogioacchino.delregno@somainline.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] dt-bindings: clock: qcom: reference qcom-gcc.yaml
Message-ID: <l73uszlhnhyamfuwm7f6bbmockttwihsylkkgbyedkdseznlka@mtr5c7r4nqt4>
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>

On Fri, May 31, 2024 at 03:52:18PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Unify Qualcomm clock controllers by referencing qcom,gcc.yaml where
> applicable.  Several existing bindings for these display/GPU/CAM clock
> controllers already do it.

The series looks good to me with a single point in mind. You are writing
that dispcc/videocc/etc are a variant of GCC. However GCC is a Global
Clock Controller. What about renaming qcom,gcc.yaml to
qcom,cc-common.yaml ? Then the rest makes total sense to me.

> 
> No external dependencies, this CAN be applied independently, but require
> power-domain-cells in each binding, just like Dmitry's new set is doing.
> 
> https://lore.kernel.org/all/20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org/
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (16):
>       dt-bindings: clock: qcom,sm8450-videocc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,videocc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,dispcc-sc8280xp: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,dispcc-sm6350: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,dispcc-sm8x50: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,gpucc-sdm660: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,gpucc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,msm8998-gpucc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,qcm2290-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sc7180-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sc7280-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sdm845-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sm6115-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sm8450-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sm8550-dispcc: reference qcom,gcc.yaml
>       dt-bindings: clock: qcom,sm8450-gpucc: reference qcom,gcc.yaml
> 
>  .../bindings/clock/qcom,dispcc-sc8280xp.yaml         | 20 ++++----------------
>  .../bindings/clock/qcom,dispcc-sm6350.yaml           | 20 ++++----------------
>  .../bindings/clock/qcom,dispcc-sm8x50.yaml           | 18 ++----------------
>  .../devicetree/bindings/clock/qcom,gpucc-sdm660.yaml | 20 ++++----------------
>  .../devicetree/bindings/clock/qcom,gpucc.yaml        | 20 ++++----------------
>  .../bindings/clock/qcom,msm8998-gpucc.yaml           | 20 ++++----------------
>  .../bindings/clock/qcom,qcm2290-dispcc.yaml          | 20 ++++----------------
>  .../bindings/clock/qcom,sc7180-dispcc.yaml           | 20 ++++----------------
>  .../bindings/clock/qcom,sc7280-dispcc.yaml           | 20 ++++----------------
>  .../bindings/clock/qcom,sdm845-dispcc.yaml           | 20 ++++----------------
>  .../bindings/clock/qcom,sm6115-dispcc.yaml           | 20 ++++----------------
>  .../bindings/clock/qcom,sm8450-dispcc.yaml           | 20 ++++----------------
>  .../devicetree/bindings/clock/qcom,sm8450-gpucc.yaml | 20 ++++----------------
>  .../bindings/clock/qcom,sm8450-videocc.yaml          | 20 ++++----------------
>  .../bindings/clock/qcom,sm8550-dispcc.yaml           | 20 ++++----------------
>  .../devicetree/bindings/clock/qcom,videocc.yaml      | 19 +++----------------
>  16 files changed, 61 insertions(+), 256 deletions(-)
> ---
> base-commit: b0afb900b7d235d879f8e8e4babfe77d9db76f2f
> change-id: 20240531-dt-bindings-qcom-gcc-e2955fd60004
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

-- 
With best wishes
Dmitry

