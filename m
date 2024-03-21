Return-Path: <linux-clk+bounces-4840-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3A28856AD
	for <lists+linux-clk@lfdr.de>; Thu, 21 Mar 2024 10:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CAC51F21A6E
	for <lists+linux-clk@lfdr.de>; Thu, 21 Mar 2024 09:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947F454BF7;
	Thu, 21 Mar 2024 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZmR/82u"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E031D4EB47
	for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711014304; cv=none; b=rtAEjBt/16Uzy10LXYqmYTu4xeVpz+zdgTvT5Gs0b9/Dm26WJaQHlsPY3IbIoObcIPbFq0yfjX03eYBhWwGEGRYjKsV6XyjZZhmKTkD4iFOGvhklgjoRwTy87ib5K0ToXQdexMo9GY1hCoD/ud4hVY/VamsmTvQJfo9++oGLb34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711014304; c=relaxed/simple;
	bh=USv2fOw88lYmsXLEAJsg9gUy2ptDgrHgVv9Sgni5eFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDrEuXVIpEaR/nSKNNbFHnQC0y6K9smdYxqSsLMEhuJO2Z3a1C3Yg3qtx5wYTpGmfoe1F5oU3QFIJJbGVS1bMFjPM5UpiRhJe+THRhoNrdnqdsFUL050XsbygZ1sqsneAxxemUqNcY1cYos/6EkJIgocpEFEV4dmB18F3e/ILFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZmR/82u; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso701934276.2
        for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 02:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711014302; x=1711619102; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wsq6huHxMXFKmsQE0mL/RER+3c0d8PlFp7FnnyoJiEE=;
        b=YZmR/82uRfmQtV/WX6IQlMczh7Ac9gJHx6eRJtpJOTf9ZojtwyKMwDw/BeZ9oPP7vD
         5W8jCqW3Eca8b8HDksAOu+EdXs6gW9d5uCDiHNB37NdFiEscYGPPcVOvzBw30pX26CUF
         KX2B9/1Du+riMrWgYPr0gkKkQxRzldc23Aoug8eOelaqtpaqTW65zljuakXEAoiS7RT9
         Ybs5AyRUHiVBg/2uh6xvIsWomag3MlGkcQNjiJ2Aeh9nfCPknblfd7iSkfQao9BDe4D2
         eZ42mV9udbjHycM5JoNfcX5Df8icELJy4hNVMX01T/hWvmKIvBziC2/hmFJxTvQdIJt0
         eX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711014302; x=1711619102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsq6huHxMXFKmsQE0mL/RER+3c0d8PlFp7FnnyoJiEE=;
        b=HLLw3q/jspbkYQSw/kK3NJO/dD+yNum6P8Rkc7jXiq81Dve8VaHFIlZHQLrys1G28i
         2SdFqOdICZM3fLJHHgbL06q+oD1nsnqogP4cDZyWnzGPSmcpAUvTJ2jk8PUG1oStraev
         erIYx6kNiS2DBX0uY1YAexrJs3b1JbkRNmeytPhI3vtE9Jzgi5ksRKHRwbck4RP2KqAE
         2kH4YlBggYrqfS8LsEvxHEheHWzY7bqoylH3Xu9GhrN03OHfu5fO7iA8LhGzsaZTCrzd
         +jQHoScOZQ67KCPqM5E3JdJKDgh/WpDgHKn5AQAQ68Hlx6++AmtYu9+tCU+o9zum9GQz
         6Wiw==
X-Forwarded-Encrypted: i=1; AJvYcCWSA3NdMo+rg8OF1PCF1AQZ5g+07YL4dqQXI9PIktFML5WqQoGk260mOMhDZTtjxkH0f9blo/LACqwiXGmXC8hfpL1N/MGSYFLt
X-Gm-Message-State: AOJu0Yz3sPiTsp1nz/dOfFonhFZhDNHU3yVdo0NJXezhKiLDWNJ4yxVr
	cqpqZufuohKt+5nGvnNwaxaD+mS0lLaBfDS3fvbMk2IFWn2qAtJ8EmFh3gvX+CDDLtm7DmS4GPk
	LiDQ8/tw8/K4XdL6Z5pUzCdErDl32zCdXyAAkzRFpngTmxntmynA=
X-Google-Smtp-Source: AGHT+IHYhhmTdh8jHR73tDxXGEyjQHJf8EIgdwjfMRiP3YSKMMj9MKe6GuvrydG88IgBd8VMu6yZcI70K5Z7Y418EUo=
X-Received: by 2002:a25:ae84:0:b0:dcb:e82c:f7d with SMTP id
 b4-20020a25ae84000000b00dcbe82c0f7dmr1349884ybj.41.1711014301808; Thu, 21 Mar
 2024 02:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321092529.13362-1-quic_jkona@quicinc.com> <20240321092529.13362-3-quic_jkona@quicinc.com>
In-Reply-To: <20240321092529.13362-3-quic_jkona@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 11:44:50 +0200
Message-ID: <CAA8EJpqrJ1bh3hdS8Gm-QRe1iEYj34Wwz+=vOtONUgAF=hOZYw@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND 2/6] clk: qcom: videocc-sm8550: Add support for
 videocc XO clk ares
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

On Thu, 21 Mar 2024 at 11:26, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
> Add support for videocc XO clk ares for consumer drivers to be
> able to request for this reset.

Nit: s/for//

>
> Fixes: f53153a37969 ("clk: qcom: videocc-sm8550: Add video clock controller driver for SM8550")
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/videocc-sm8550.c | 1 +
>  1 file changed, 1 insertion(+)


-- 
With best wishes
Dmitry

