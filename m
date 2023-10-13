Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF3DC7C912A
	for <lists+linux-clk@lfdr.de>; Sat, 14 Oct 2023 01:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbjJMXIE (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 13 Oct 2023 19:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbjJMXID (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Oct 2023 19:08:03 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C890BC0
        for <linux-clk@vger.kernel.org>; Fri, 13 Oct 2023 16:07:59 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a822f96aedso12271987b3.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Oct 2023 16:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697238479; x=1697843279; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GTZAp68ttuyTxKkLmjiKDcnt+ot03nWQqCAoiuWLPj4=;
        b=XgUYQp9VvazENLlju8K1vLaG5E6Pd4U/7P1yfNrguASJ4IjSLNW+Hvyj/EQeuzTQBM
         9NqGuyf45rliaT/JBLcg0mPLyWaIgTS9uP661Zpsr/3vCJTo9x1uyYb6zP4vUR0IlmZN
         ITAxnHSYq0say4s8Zmgq4PIMtF6w0gac3OiJCf/Pg0fgf3v6DACvPZF46l+B4WBZAq0P
         g9QmcmYIRS274JsmVP3iRM0L3mcOGLD5p62algh+RIgnlFAcKrB8vsa9AnLNQfrFGRX5
         ZihNikwH2Eh2mPi2J+nh/Jiit5c1kmXBuZOBVwD6PES2G8VPMLja1tg4W7fccJoUHSUS
         Ym/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697238479; x=1697843279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTZAp68ttuyTxKkLmjiKDcnt+ot03nWQqCAoiuWLPj4=;
        b=V+xa+ckpI+B4YjonPwd3a2lo9ktVjJ6kD7tNQoElhDk8hGdcGrhELUiY0RHIJbngVN
         sOYe7QIpInSg8NwpSO5wCngf19YLyrTej2lN7oRlDSQbpXdoicUrQDWWkZAolL+cc0hS
         0TCQIaLsKKcEZlSFBjHbUEtEUUcTEDXmWpyb0ChPFLHxIPVbIZLfQFuw0JzN+X0EULrB
         4c6+X2MgnmXOVtrwqIlv0x1iC8zZ2dx9q2Nz67MC20ss6EhSF84p5UQLjurhT2jCyLDY
         W9CxsHh68OdsvH2cNqNrXpvxRMI6MUMekwvfqNaJgwoTLaNhJ5507Rusn6GwPV1ykhqc
         0tPA==
X-Gm-Message-State: AOJu0YwdAhRBLbQQK1BDv9uKyIZrZo8Qr+XrvdzF688dY+bUJqTRl45E
        iNdZipaGtWUreWUux7mNnMhu6Eg+BcXvgw9g/j1jBDnPOnMAos9k
X-Google-Smtp-Source: AGHT+IEV/6cjtm5aswWQE7+Xj1dG/j34dWuGSndGd1o4xDdSx/J/e4MW+VMXlArDM1lZpgch8aAfkjCvTI8QUarCcvU=
X-Received: by 2002:a0d:d796:0:b0:5a8:2b82:a031 with SMTP id
 z144-20020a0dd796000000b005a82b82a031mr2481006ywd.26.1697238478953; Fri, 13
 Oct 2023 16:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231013164025.3541606-1-robimarko@gmail.com> <20231013164025.3541606-2-robimarko@gmail.com>
In-Reply-To: <20231013164025.3541606-2-robimarko@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 14 Oct 2023 02:07:47 +0300
Message-ID: <CAA8EJpqG0fL2j-+4qN9kw8fDdGmE7LpRYdJtqEPsGFScwRz4AQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: ipq8074: pass QMP PCI PHY PIPE
 clocks to GCC
To:     Robert Marko <robimarko@gmail.com>
Cc:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 13 Oct 2023 at 19:41, Robert Marko <robimarko@gmail.com> wrote:
>
> Pass QMP PCI PHY PIPE clocks to the GCC controller so it does not have to
> find them by matching globaly by name.
>
> If not passed directly, driver maintains backwards compatibility by then
> falling back to global lookup.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v2:
> * Make clocks and clock-names one-per-line
>
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
