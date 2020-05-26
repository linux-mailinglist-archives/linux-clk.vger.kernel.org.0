Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FFE1B6A14
	for <lists+linux-clk@lfdr.de>; Fri, 24 Apr 2020 01:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgDWXle (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 23 Apr 2020 19:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgDWXle (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Apr 2020 19:41:34 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F2BC09B042
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2020 16:41:33 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x15so3872448pfa.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2020 16:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=UvY6yRSr9LoxwMbjAv+ye5C9hpbZ65HCNFVPFwYb5gE=;
        b=jUVhZMwkNiCZgtMssvAQEOCuMI34GiHeO2OcbYFNA0MO2tPfgE3ecSGPvuR4DPi4rw
         nrDqAIP+/voLFN3dUnkLv0OMk3nDYNqW8jwkBtqhMo4F2DCygEWZMgmz9XH5/kNZc0bd
         GWIkMaBex51qJfiKuQsvPBcHbWzw3cikkvWe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=UvY6yRSr9LoxwMbjAv+ye5C9hpbZ65HCNFVPFwYb5gE=;
        b=WQcJbU6QVld3qQZQvcY9of12k0zOaQT/odKMPYv62wYDLCtXImEE0cHmbf/QLBV+Vu
         YCIwRlv4d8IUtjW3G0FGOFDvD5lwVk1DW5UpnMW4/HCStIzKKncIVl/j8C9/dOM0LQ74
         Oq+WVJ/cdE0qL5CcN/PFP7ANaowZFwgLtRVQPyHDmjYsyCL9DrXAacOQsU0s2t0E/K6y
         ha7i6yxVKBP1PX1z4DjIFaOtFdoe0PqWTbw6XvU1+iA7EgwUvi5UUimeo0ciXZRMFaXE
         2E5FRxnYBzNA0skh1bPJkW9RbD2nUO0yaa69WqQ8gcmAsyONPnEFobxrvH9NN7TW1KFD
         8R9w==
X-Gm-Message-State: AGi0PubwStSy69FJ7flBSHZh2nmTiUf29B4D45palN+LQ6NlxQREgQHj
        WIyx9q2qCKB6Dp5d4Xdrf5Rqsw==
X-Google-Smtp-Source: APiQypL/1HUpGNgMyu557lD7TWDtpCq8eHWZGde9uRaxlMdNp6k6YJ/zYkJ2Q2VQfzwQSkKLN4Cvvg==
X-Received: by 2002:a65:4641:: with SMTP id k1mr6634067pgr.406.1587685292738;
        Thu, 23 Apr 2020 16:41:32 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h193sm3755976pfe.30.2020.04.23.16.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 16:41:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585701031-28871-3-git-send-email-tanmay@codeaurora.org>
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org> <1585701031-28871-3-git-send-email-tanmay@codeaurora.org>
Subject: Re: [DPU PATCH v5 2/5] drm: add constant N value in helper file
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Chandan Uddaraju <chandanu@codeaurora.org>, robdclark@gmail.com,
        abhinavk@codeaurora.org, nganji@codeaurora.org,
        jsanka@codeaurora.org, aravindh@codeaurora.org,
        hoegsberg@google.com, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Vara Reddy <varar@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        seanpaul@chromium.org
Date:   Thu, 23 Apr 2020 16:41:31 -0700
Message-ID: <158768529129.135303.14920680590198766597@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tanmay Shah (2020-03-31 17:30:28)
> From: Chandan Uddaraju <chandanu@codeaurora.org>
>=20
> The constant N value (0x8000) is used by multiple DP

There's one driver using it, not multiple.

> drivers. Define this value in header file and use this
> in the existing i915 display driver.
>=20
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
